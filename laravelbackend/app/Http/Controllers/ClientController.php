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
            'genre' => 'required',
            'profession' => 'required',
            'etatcivil' => 'required',
            'type_piece' => 'required',
            'numero_piece' => 'required',
            'adresse' => 'required',
            'contact' => 'required',
            'mail' => 'required',
        ]);
        
            $customer = new Client;
            $customer->noms = $request->input('noms');
            $customer->genre = $request->input('genre');
            $customer->profession = $request->input('profession');
            $customer->etatcivil = $request->input('etatcivil');
            $customer->type_piece = $request->input('type_piece');
            $customer->numero_piece = $request->input('numero_piece');
            $customer->adresse = $request->input('adresse');
            $customer->contact = $request->input('contact');
            $customer->mail = $request->input('mail');
            $customer->save();
            return response()->json(['message'=>'inserted successfully'],200);
               
    }
}
