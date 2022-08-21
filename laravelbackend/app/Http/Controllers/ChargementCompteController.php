<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChargementCompteController extends Controller
{
    public function store(Request $request){
        $request->validate([
            'client_id' => 'required',
            'montant' => 'required',
        ]);
        \DB::statement("call chargementCompte(?,?)",[
            $request->client_id,
            $request->montant
        ]);
        return back()->with('message','insertion avec succes');
    }
}
