<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{ProprietaireController,StudentController,ClientController,CategorieController,ChauffeurController,ChargementCompteController};



Route::get('/', function () {return view('layouts.dashboard');});

Route::get('/addclient',function(){return view('pages.clientAdd');})->name('addclient');
Route::get('/clients', [ClientController::class ,'showClient'])->name('client.index');
Route::post('/client/add',[ClientController::class, 'store'])->name('client.add');
Route::get('/client/edit/{id}',[ClientController::class, 'edit'])->name('client.edit');


// chargement compte
Route::post('/compte/add', [ChargementCompteController::class, 'store'])->name('compte.store');
Route::get('/copmte/show', [ChargementCompteController::class, 'index'])->name('compte.index');

//Qr code 
Route::get('/qrcode/{id}', [ClientController::class, 'generateCard'])->name('generate');