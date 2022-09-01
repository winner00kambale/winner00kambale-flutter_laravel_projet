<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ParameterPrice;

class ParameterPriceController extends Controller
{
    public function index(){
        return ParameterPrice::All();
    }
    public function GetPrice(){
        $prix = ParameterPrice::All();
        return view('pages.paramettres.price',compact('prix'));
    }
    public function store(Request $request){
        $request->validate([
            'prix'=>'required',
        ]);
        \DB::statement("call sp_price(?)",[
            $request->prix,
        ]);
        return redirect()->route('paramettrePrice');
    }
}
