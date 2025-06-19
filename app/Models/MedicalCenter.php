<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MedicalCenter extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'medical_type',
        'name',
        'code',
        'address',
        'status',
    ];
    
    
}
