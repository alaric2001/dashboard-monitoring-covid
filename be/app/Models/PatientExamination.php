<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientExamination extends Model
{
    use HasFactory;
    protected $fillable = [
        'weight',
        'height',
        'blood',
        'notes',
        'patient_id',
        'doctor_id',
        'covid_case',
    ];

    // Define the relationship with the patients table
    public function patient()
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function doctor()
    {
        return $this->belongsTo(Doctor::class, 'doctor_id');
    }
}
