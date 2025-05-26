<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobServiceRecords extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'job_id',
        'item_id',
        'entry_date',
        'expire_date',
        'remarks',
        'medical_centers',
        'slip_no',
        'mofa_no',
        'is_enabled',
        'is_complete',
        'is_agent_purchased',
        'status_id',
    ];

    public function items()
    {
        return $this->belongsTo(Item::class, 'item_id');
    }
        
    public function servicestatus()
    {
        return $this->belongsTo(StatusList::class, 'status_id');
    }
}
