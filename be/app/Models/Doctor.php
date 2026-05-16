<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'gender',
        'birth_date',
        'address',
        'contact',
        'specialization',
    ];

    // Define the relationship with radiology examinations
    public function radiologies()
    {
        return $this->hasMany(Radiology::class, 'doctor_id');
    }

    public function examination()
    {
        return $this->hasMany(PatientExamination::class);
    }
}
