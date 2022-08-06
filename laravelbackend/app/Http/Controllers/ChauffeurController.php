<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Chauffeur;

class ChauffeurController extends Controller
{
   public function index(){
    return Chauffeur::All();
   }
}
