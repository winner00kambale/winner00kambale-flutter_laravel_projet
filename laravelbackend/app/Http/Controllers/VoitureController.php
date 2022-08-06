<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Voiture;

class VoitureController extends Controller
{
    public function index(){
        return Voiture::All();
    }
}
