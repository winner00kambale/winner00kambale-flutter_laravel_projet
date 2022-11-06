<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ChargementCompte;

class ChargementCompteController extends Controller
{
    public function index(){
        $data = \DB::select("SELECT * FROM `afficherChargement` ORDER BY id DESC");
        return view('pages.chargementShow',compact('data'));
    }

    public function store(Request $request){
        $request->validate([
            'noms' => 'required',
            'montant' => 'required',
        ]);
        \DB::statement("call chargementCompte(?,?)",[
            $request->noms,
            $request->montant
        ]);
        return redirect()->route('compte.index')->with('message','chargement avec succes');
    }

    //API
    public function allChargement(){
        return ChargementCompte::All();
    }
    public function storeChargement(Request $request){
        \DB::statement("call chargementCompte(?,?)",[
            $request->client_id,
            $request->montant
        ]);
    }
}
