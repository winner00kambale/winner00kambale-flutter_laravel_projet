<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;
    protected $table='clients';
    protected $fillable=[
        'noms',
        'genre',
        'profession',
        'etatcivil',
        'type_piece',
        'numero_piece',
        'adresse',
        'mail',
        'contact',
        'montant_compte',
    ];
}
