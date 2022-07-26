<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{UserController,PayementController,ProprietaireController,StudentController,ClientController,CategorieController,ChauffeurController,ChargementCompteController,ParameterPriceController};

//Client
Route::post('/clients', [ClientController::class ,'storeClient']);
Route::get('/clientsAll', [ClientController::class, 'index']);
Route::get('/clients/{id}',[ClientController::class, 'editClient']);

//proprietaire
Route::get('/proprietaire', [ProprietaireController::class, 'index']);
Route::post('/proprietaireSave', [ProprietaireController::class, 'storeProprietaire']);

//chaffeur
Route::get('/chaffeurAll', [ChauffeurController::class, 'index']);
Route::post('/chauffeur', [ChauffeurController::class, 'storeChauffeur']);

//Chargement Du Compte
Route::get('/CompteAll', [ChargementCompteController::class, 'allChargement']);
Route::post('/CompteSave', [ChargementCompteController::class, 'storeChargement']);

//Payement
Route::get('/payementAll', [PayementController::class, 'index']);
Route::post('/payementSave', [PayementController::class, 'store']);

//Paramettre
Route::get('/PrixUnit', [ParameterPriceController::class, 'index']);

//Auth
// Route::post('/userLogin', [UserController::class, 'login']);
Route::post('/userSave', [UserController::class, 'store']);
Route::post('/loginuser', [UserController::class, 'login']);



