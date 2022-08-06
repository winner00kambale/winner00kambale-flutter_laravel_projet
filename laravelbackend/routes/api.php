<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{StudentController,ClientController,CategorieController,ChauffeurController};

Route::get('/student', [StudentController::class, 'index']);
Route::get('/student/{id}',[StudentController::class, 'destroy']);

//Client
Route::post('/clients', [ClientController::class ,'store']);
Route::get('/clientsAll', [ClientController::class, 'index']);

//Voiture
Route::get('/categorieAll',[CategorieController::class, 'index']);
Route::post('/categorie',[CategorieController::class, 'store']);


//chaffeur
Route::get('/chaffeurAll',[ChauffeurController::class, 'index']);



