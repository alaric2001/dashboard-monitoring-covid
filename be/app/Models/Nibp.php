<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Nibp extends Model
{
    use HasFactory;
    protected $table = 'nibp';
    protected $fillable = ['patient_id', 'diastolic', 'systolic','patient_check'];

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }
    protected function serializeDate(\DateTimeInterface $date)
    {
        return $date->setTimezone('Asia/Jakarta')->format('Y-m-d H:i:s');
    }
}
