<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Affectation;

class AffectationController extends Controller
{
    public function store(Request $request){
        $request->validate([
            'chauffeur_id' => 'required',
            'voiture_id' => 'required'
        ]);
        // $affectation = new Affectation;
        // $affectation->chauffeur_id = $request->input('chauffeur_id');
        // $affectation->voiture_id = $request->input('voiture_id');
        // $affectation->save();
        \DB::statement("call sp_affectation(?,?)",[
            $request->chauffeur_id,
            $request->voiture_id
        ]);
        return back()->with('message','insertion avec succes');
    }
}
