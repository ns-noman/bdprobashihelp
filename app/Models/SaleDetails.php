<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SaleDetails extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'sale_id',
        'item_id',
        'date',
        'purchase_price',
        'sale_price',
        'profit',
    ];
}
