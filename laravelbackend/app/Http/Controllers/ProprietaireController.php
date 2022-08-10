<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Proprietaire;

class ProprietaireController extends Controller
{
    public function index(){
        return Proprietaire::All();
    }
}
