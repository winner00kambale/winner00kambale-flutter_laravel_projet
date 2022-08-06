<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categorie;

class CategorieController extends Controller
{
    public function index(){
        return Categorie::All();
    }
    public function store(Request $request){
        $request->validate([
            'designation'=>'require',
        ]);
        $categorie = new Categorie;
        $categorie->designation = $request->input('designation');
        $categorie->save();
        return response()->json(['message'=>'inserted successfully'],200);
    }
}
