<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{StudentController,ClientController};

Route::get('/student', [StudentController::class, 'index']);

//Client
Route::post('/clients', [ClientController::class ,'store']);
Route::get('/clientsAll', [ClientController::class, 'index']);


