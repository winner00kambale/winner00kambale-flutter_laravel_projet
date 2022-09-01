<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{ProprietaireController,StudentController,ClientController,CategorieController,ChauffeurController};

//Client
Route::post('/clients', [ClientController::class ,'store']);

Route::get('/clientsAll', [ClientController::class, 'index']);
Route::get('/clients/delete/{id}',[ClientController::class, 'delete']);
Route::get('/clients/{id}',[ClientController::class, 'edit']);

//proprietaire
Route::get('/proprietaire', [ProprietaireController::class, 'index']);

//Voiture
Route::get('/categorieAll',[CategorieController::class, 'index']);
Route::post('/categorie',[CategorieController::class, 'store']);


//chaffeur
Route::get('/chaffeurAll',[ChauffeurController::class, 'index']);



