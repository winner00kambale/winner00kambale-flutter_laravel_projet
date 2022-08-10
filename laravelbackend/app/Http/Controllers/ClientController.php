<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;

class ClientController extends Controller
{
    public function index(){
        return Client::All();
    }
    public function store(Request $request){
        $request->validate([
            'noms' => 'required',
            'profession' => 'required',
            'type_piece' => 'required',
            'numero_piece' => 'required',
            'adresse' => 'required',
            'contact' => 'required',
            'mail' => 'required',
        ]);
        
            $customer = new Client;
            $customer->noms = $request->input('noms');
            $customer->profession = $request->input('profession');
            $customer->type_piece = $request->input('type_piece');
            $customer->numero_piece = $request->input('numero_piece');
            $customer->adresse = $request->input('adresse');
            $customer->contact = $request->input('contact');
            $customer->mail = $request->input('mail');
            $customer->montant_compte = $request->input('montant_compte');
            $customer->save();
            return response()->json(['message'=>'inserted successfully'],200);
               
    }
    public function update(Request $request,$id){
            $customer = Client::find($id);
            $customer->noms = $request->noms;
            $customer->profession = $request->profession;
            $customer->type_piece = $request->type_piece;
            $customer->numero_piece = $request->numero_piece;
            $customer->adresse = $request->adresse;
            $customer->contact = $request->contact;
            $customer->mail = $request->mail;
            $customer->montant_compte = $request->montant_compte;
            $customer->update();
            return response()->json(['message'=>'updated successfully'],200);
    }
    public function delete($id){
        Client::find($id)->delete();
        return response()->json(['message'=>'deleted successfully']);   
    }

    public function edit($id){
        $client = Client::find($id);
        return $client;
     }
}
