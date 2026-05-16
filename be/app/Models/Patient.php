<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Patient extends Model
{
    use HasFactory;
    protected $table = 'patients';
    protected $primaryKey = 'id';
    protected $fillable = [
        'patient_name',
        'admission_date',
        'discharge_date',
        'gender',
        'birth',
        'id_card',
        'address',
        'contact',
        'education',
        'occupation',
        'photo',
        'referred',
        'next_of_kin_name',
        'relationship',
        'next_of_kin_address',
        'next_of_kin_contact',
    ];

    public function examination()
    {
        return $this->hasMany(PatientExamination::class);
    }

    public function hr()
    {
        return $this->hasMany(HeartRate::class);
    }

    public function rr()
    {
        return $this->hasMany(RespirationRate::class);
    }

    public function spo2()
    {
        return $this->hasMany(Spo2::class);
    }

    public function temp()
    {
        return $this->hasMany(Temperature::class);
    }

    public function nibp()
    {
        return $this->hasMany(Nibp::class);
    }

    public function lab()
    {
        return $this->hasMany(Lab::class);
    }

    public function medicine()
    {
        return $this->hasMany(Medicine::class);
    }

    public function radiology()
    {
        return $this->hasMany(Radiology::class);
    }

    public function room()
    {
        return $this->hasMany(Room::class);
    }

    public function ews()
    {
        return $this->hasMany(Ews::class, 'patient_id');
    }
}
