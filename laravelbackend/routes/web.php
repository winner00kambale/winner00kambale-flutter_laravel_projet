<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{AffectationController,ProprietaireController,StudentController,ClientController,CategorieController,ChauffeurController,ChargementCompteController};



Route::get('/', function () {return view('layouts.dashboard');});

Route::get('/addclient',function(){return view('pages.clientAdd');})->name('addclient');
Route::get('/clients', [ClientController::class ,'showClient'])->name('client.index');
Route::post('/client/add',[ClientController::class, 'store'])->name('client.add');
Route::get('/client/edit/{id}',[ClientController::class, 'edit'])->name('client.edit');

//Chauffeur
Route::get('/addchauffeur',function(){return view('pages.chauffeur.addchauffeur');})->name('addchauffeur');
Route::get('/chaffeur', [ChauffeurController::class ,'showChauffeur'])->name('chaffeur.index');
Route::post('/chauffeur/add',[ChauffeurController::class, 'store'])->name('chauffeur.add');
Route::get('/chauffeur/edit/{id}',[ChauffeurController::class, 'edit'])->name('chauffeur.edit');


// chargement compte
Route::post('/compte/add', [ChargementCompteController::class, 'store'])->name('compte.store');
Route::get('/copmte/show', [ChargementCompteController::class, 'index'])->name('compte.index');

//Affectation
Route::post('/affectation/add', [AffectationController::class, 'store'])->name('affectation.store');

//Qr code 
Route::get('/generateCard/{id}', [ClientController::class, 'generateCard'])->name('generateCard');