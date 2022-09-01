<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Payement;

class PayementController extends Controller
{
    public function ShowPayement(){
        $payement = \DB::select("SELECT * FROM `affpayement` ORDER BY id DESC");
        return view('pages.payement',compact('payement'));
    }

    //APi
    public function index(){
        return Payement::All();
    }

    public function store(Request $request){

        \DB::statement("call sp_payement(?,?,?)",[
            $request->refclient,
            $request->refaffect,
            $request->nb_place
        ]);
    }
}
