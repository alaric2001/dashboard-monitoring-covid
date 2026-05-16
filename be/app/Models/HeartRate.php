<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HeartRate extends Model
{
    use HasFactory;
    protected $table = 'heart_rate';
    protected $fillable = ['patient_id', 'heart_beats', 'patient_check'];

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }
    protected function serializeDate(\DateTimeInterface $date)
    {
        return $date->setTimezone('Asia/Jakarta')->format('Y-m-d H:i:s');
    }
}
