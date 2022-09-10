<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Chauffeur;

class AthController extends Controller
{
    public function login(Request $req){
        //validate
        $rules = [
            'mail' => 'required',
            'noms' => 'required',
        ];
        $req->validate($rules);
        $user = Chauffeur::where('mail',$req->mail)->first();
        if ($user && hash::check($req->noms, $user->noms) ) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response =['user' =>$user, 'token'=>$token];
            return response()->json($response, 200);
        }
        $response = ['message'=>'Incorrect mail or password'];
        return response()->json($response, 400);
    }
}
