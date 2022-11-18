<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Codedge\Fpdf\Fpdf\Fpdf;

class ClientController extends Controller
{
    public function showClient(){
        $clients= Client::All();
        return view('pages.pclient',compact('clients'));
    }
    
    public function store(Request $request){
        $request->validate([
            'noms' => 'required',
            'genre' => 'required',
            'profession' => 'required',
            'etatcivil' => 'required',
            'type_piece' => 'required',
            'numero_piece' => 'required',
            'adresse' => 'required',
            'mail' => 'required',
            'contact' => 'required',
            'montant_compte' => 'required',        
        ]);
            $customer = new Client;
            $customer->noms = $request->input('noms');
            $customer->genre = $request->input('genre');
            $customer->profession = $request->input('profession');
            $customer->etatcivil = $request->input('etatcivil');
            $customer->type_piece = $request->input('type_piece');
            $customer->numero_piece = $request->input('numero_piece');
            $customer->adresse = $request->input('adresse');
            $customer->mail = $request->input('mail');
            $customer->contact = $request->input('contact');
            $customer->montant_compte = $request->input('montant_compte');
            $customer->save();
            return redirect()->route('client.index')->with('message','insertion avec succes');            
    }
    public function update(Request $request,$id){
            $customer = Client::find($id);
            $customer->noms = $request->noms;
            $customer->genre = $request->genre;
            $customer->profession = $request->profession;
            $customer->etatcivil = $request->etatcivil;
            $customer->type_piece = $request->type_piece;
            $customer->numero_piece = $request->numero_piece;
            $customer->adresse = $request->adresse;
            $customer->mail = $request->mail;
            $customer->contact = $request->contact;
            $customer->montant_compte = $request->montant_compte;
            $customer->update();
            return redirect()->route('client.index')->with('message','updated successfully');
    }
    public function delete($id){
        Client::find($id)->delete();
        return response()->json(['message'=>'deleted successfully']);   
    }

    public function edit($id){
        $client = Client::find($id);
        // $data = $client[0];
        return view('pages.chargementCompte',compact('client'));
     }

     public function generateCard($id){
        $data = Client::find($id);
        $qrcode = QrCode::size(80)->generate($data->noms);
         return view('pages.qrcode',compact('qrcode','data')); 
     }
     public function detail($client){
        $data = \DB::select("SELECT * FROM affpayement WHERE noms='$client'");
        $data1 = \DB::select("SELECT id,noms,contact FROM `clients` WHERE noms='$client'");
        $montant = \DB::select("SELECT SUM(montant) AS total,curdate() AS date_ FROM `affpayement` WHERE noms='$client'");
        return view('rapport.detail',compact('data','data1','montant'));
     }
     public function detailChragement($client){
        $data = \DB::select("SELECT * FROM afficherchargement WHERE noms='$client'");
        $data1 = \DB::select("SELECT id,noms,contact FROM `clients` WHERE noms='$client'");
        $montant = \DB::select("SELECT SUM(montant) AS total,curdate() AS date_ FROM `afficherchargement` WHERE noms='$client'");
        return view('rapport.detailChargement',compact('data','data1','montant'));
     }

     public function rapport(Request $request){
        $request->validate([
            'date1' => 'required',
            'date2' => 'required'
        ]);
        $date1 = $request->input('date1');
        $date2 = $request->input('date2');
        $total = \DB::select("SELECT SUM(montant) total,date_payement,curdate() date_ FROM `affpayement` WHERE date_payement BETWEEN '$date1' AND '$date2'");
        $data = \DB::select("SELECT * FROM `affpayement` WHERE date_payement BETWEEN '$date1' AND '$date2'"); 
        return view('rapport.rapport',compact('data','total'));
     }

     public function rapportChargement(Request $request){
        $request->validate([
            'date1' => 'required',
            'date2' => 'required'
        ]);
        $date1 = $request->input('date1');
        $date2 = $request->input('date2');
        $total = \DB::select("SELECT SUM(montant) total,date_payement,curdate() date_ FROM afficherchargement WHERE date_payement BETWEEN '$date1' AND '$date2'");
        $data = \DB::select("SELECT * FROM `afficherchargement` WHERE date_payement BETWEEN '$date1' AND '$date2'"); 
        return view('rapport.chargement',compact('data','total'));
     }

     //API
     public function index(){
        return Client::All();
    }

     public function storeClient(Request $request){
            $customer = new Client;
            $customer->noms = $request->input('noms');
            $customer->genre = $request->input('genre');
            $customer->profession = $request->input('profession');
            $customer->etatcivil = $request->input('etatcivil');
            $customer->type_piece = $request->input('type_piece');
            $customer->numero_piece = $request->input('numero_piece');
            $customer->adresse = $request->input('adresse');
            $customer->mail = $request->input('mail');
            $customer->contact = $request->input('contact');
            $customer->montant_compte = $request->input('montant_compte');
            $customer->save();            
    }
    public function editClient($id){
        $client = Client::find($id);
        return $client;
     }
}
