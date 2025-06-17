<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'customer_id',
        'account_id',
        'passenger_name',
        'passenger_passport_no',
        'passport_img',
        'country_id',
        'localhost_no',
        'invoice_no',
        'date',
        'total_price',
        'vat_tax',
        'discount_method',
        'discount_rate',
        'discount',
        'total_payable',
        'paid_amount',
        'reference_number',
        'note',
        'payment_status',
        'status',
        'created_by_id',
        'updated_by_id',
    ];
    
    public function serviceshorts()
    {
        return $this->hasMany(JobServiceRecords::class, 'job_id')->with(['items','servicestatus']);
    }
}