<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medicine extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'type', 'stock','patient_id',];
    public function patient()
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }
}
