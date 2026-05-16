<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;
    protected $fillable = ['room_name', 'patient_id', 'ward_id'];

    public function patient()
    {
        return $this->belongsTo(Patient::class);
    }

    public function ward()
    {
        return $this->belongsTo(Ward::class);
    }

    public function ews()
    {
        return $this->hasMany(Ews::class, 'room_id');
    }
}
