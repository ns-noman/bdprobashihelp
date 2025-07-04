<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    
    protected $fillable = 
    [
        'name',
        'code',
        'email',
        'phone',
        'address',
        'organization',
        'current_balance',
        'status',
        'created_by_id',
        'updated_by_id',
    ];
}
