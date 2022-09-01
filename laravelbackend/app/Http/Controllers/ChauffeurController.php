<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Chauffeur;
use App\Models\Voiture;

class ChauffeurController extends Controller
{
   public function showChauffeur(){
      $chauffeur= Chauffeur::All();
      return view('pages.chauffeur.allchauffeur',compact('chauffeur'));
  }
  public function edit($id){
   $chauffeur = Chauffeur::find($id);
   $voiture= Voiture::All();
   return view('pages.chauffeur.attribution',compact('chauffeur','voiture'));
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
   ]);
       $customer = new Chauffeur;
       $customer->noms = $request->input('noms');
       $customer->genre = $request->input('genre');
       $customer->profession = $request->input('profession');
       $customer->etatcivil = $request->input('etatcivil');
       $customer->type_piece = $request->input('type_piece');
       $customer->numero_piece = $request->input('numero_piece');
       $customer->adresse = $request->input('adresse');
       $customer->mail = $request->input('contact');
       $customer->contact = $request->input('mail');
       $customer->save();
       return redirect()->route('chaffeur.index')->with('message','insertion avec succes');            
}

//API

    public function index(){
        return Chauffeur::All();
    }

    public function storeChauffeur(Request $request){
            $customer = new Chauffeur;
            $customer->noms = $request->input('noms');
            $customer->genre = $request->input('genre');
            $customer->profession = $request->input('profession');
            $customer->etatcivil = $request->input('etatcivil');
            $customer->type_piece = $request->input('type_piece');
            $customer->numero_piece = $request->input('numero_piece');
            $customer->adresse = $request->input('adresse');
            $customer->mail = $request->input('contact');
            $customer->contact = $request->input('mail');
            $customer->save();           
     }


}
