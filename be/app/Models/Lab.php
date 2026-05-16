<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lab extends Model
{
    use HasFactory;
    protected $fillable = [
        'lab_name',
        'patient_id',
        'test_type',
        'result',
        'sample_collection_date',
        'dispatch_to_lab_date',
        'sample_received_date',
        'processed_date',
    ];

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }
}
