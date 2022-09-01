<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{ParameterPriceController,AffectationController,ProprietaireController,StudentController,ClientController,CategorieController,ChauffeurController,ChargementCompteController};



Route::get('/', function () {return view('layouts.dashboard');})->name('dashboard');

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

//proprietaires
Route::get('/addproprietaire',function(){return view('pages.proprietaires.addproprietaire');})->name('addproprietaire');
Route::get('/proprietaire', [ProprietaireController::class, 'showProprietaire'])->name('proprietaire.index');
Route::post('/proprietaire/add', [ProprietaireController::class, 'store'])->name('proprietaire.add');

//Affectation
Route::post('/affectation/add', [AffectationController::class, 'store'])->name('affectation.store');

//Qr code 
Route::get('/generateCard/{id}', [ClientController::class, 'generateCard'])->name('generateCard');

//Paramettre prix
Route::get('/Price', [ParameterPriceController::class, 'GetPrice'])->name('paramettrePrice');
Route::post('/updatePrice', [ParameterPriceController::class, 'store'])->name('Price.price');