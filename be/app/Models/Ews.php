<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ews extends Model
{
    use HasFactory;
    protected $table = 'ews';
    protected $fillable = ['patient_id', 'color', 'patient_check'];

    
    protected function serializeDate(\DateTimeInterface $date)
    {
        return $date->setTimezone('Asia/Jakarta')->format('Y-m-d H:i:s');
    }

    public function patient()
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function room()
    {
        return $this->belongsTo(Room::class, 'room_id');
    }
}
