<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class RespirationRate extends Model
{
    use HasFactory;
    protected $table = 'respiration_rate';
    protected $fillable = ['patient_id', 'breaths', 'patient_check'];
    // Enable the timestamps
    public $timestamps = true;

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }

     // Ensure that the created_at field is in the correct format when saving
    // public function setCreatedAtAttribute($value)
    // {
    //     $this->attributes['created_at'] = Carbon::parse($value)->toDateTimeString();
    // }
    // Override the serializeDate method to set the timezone
    protected function serializeDate(\DateTimeInterface $date)
    {
        return $date->setTimezone('Asia/Jakarta')->format('Y-m-d H:i:s');
    }
    
}
