<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Proprietaire;

class ProprietaireController extends Controller
{
    public function index(){
        return Proprietaire::All();
    }
    public function showProprietaire(){
        $proprietaire = Proprietaire::All();
        return view('pages.proprietaires.allproprietaire',compact('proprietaire'));
    }

    public function store(Request $request){
        $request->validate([
            'nom' => 'required',
            'postnom' => 'required',
            'telephone' => 'required',
            'mail' => 'required',
            'adresse' => 'required',      
        ]);
           

        $proprietaire = new Proprietaire;
        $proprietaire->nom = $request->input('nom');
        $proprietaire->postnom = $request->input('postnom');
        $proprietaire->telephone =$request->input('telephone');
        $proprietaire->mail = $request->input('mail');
        $proprietaire->adresse = $request->input('adresse');
        $proprietaire->save();
        return redirect()->route('proprietaire.index')->with('message','insertion avec succes');
    }
}
