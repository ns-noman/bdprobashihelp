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
        'unit_price',
        'purchase_price',
        'profit',
        'net_sale_price',
        'net_profit',
        'is_service_generated',
    ];
}
