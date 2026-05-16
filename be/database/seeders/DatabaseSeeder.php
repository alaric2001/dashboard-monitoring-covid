<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Illuminate\Database\Seeder;
use App\Models\Patient;
use App\Models\Doctor;
use App\Models\PatientExamination;
use App\Models\NextOfKin;
use App\Models\Ward;
use App\Models\Room;
use Database\Factories\PatientFactory;
use Database\Factories\PatientExaminationFactory;
use Database\Factories\NextOfKinFactory;
use Database\Factories\DoctorFactory;
use Database\Factories\WardFactory;
use Database\Factories\RoomFactory;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run () : void
    {
        $this->call(RoleSeeder::class);
        $this->call(UserSeeder::class);
        $this->call(PermissionSeeder::class);
        Patient::factory(50)->create();
        Doctor::factory(15)->create();
        PatientExamination::factory(50)->create();
        Ward::factory(10)->create();
        Room::factory(50)->create();
    }
}