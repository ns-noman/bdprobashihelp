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
        'name',
        'description',
        'purchase_price',
        'sale_price',
        'vat',
        'status',
    ];

    public function package_items()
    {
        return $this->hasMany(PackageItem::class, 'package_id', 'id');
    }
    
    public function getPackageItemNamesAttribute()
    {
        return $this->package_items->map(function($packageItem){
            return $packageItem->product->name;
        })->implode(', ');
    }
    

}
