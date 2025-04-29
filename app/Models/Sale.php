<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'agent_id',
        'account_id',
        'passenger_name',
        'passenger_passport_no',
        'invoice_no',
        'date',
        'total_price',
        'paid_amount',
        'reference_number',
        'note',
        'payment_status',
        'status',
        'created_by_id',
        'updated_by_id',
    ];
}