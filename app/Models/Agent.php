<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'name',
        'email',
        'contact',
        'address',
        'dob',
        'nid',
        'balance',
        'is_self',
        'status',
        'created_by_id',
        'updated_by_id',
    ];
}
