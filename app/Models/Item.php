<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'item_type',
        'package_id',
        'package_item_id',
        'srl',
        'name',
        'description',
        'purchase_price',
        'sale_price',
        'vat',
        'status',
    ];

    public function package_items()
    {
        return $this->hasMany(Item::class, 'package_id')->with('item')->select('id','package_item_id','package_id');
    }
    public function item()
    {
        return $this->belongsTo(Item::class, 'package_item_id')->select('id', 'name');
    }
}
