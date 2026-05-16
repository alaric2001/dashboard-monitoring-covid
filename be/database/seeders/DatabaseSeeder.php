<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Auth: urutan penting — Permission harus ada sebelum Role melakukan sync
        $this->call(PermissionSeeder::class);
        $this->call(RoleSeeder::class);
        $this->call(UserSeeder::class);

        // Master data (tidak ada dependensi antar tabel)
        $this->call(WardSeeder::class);
        $this->call(DoctorSeeder::class);
        $this->call(NurseSeeder::class);

        // Pasien dan data klinis
        $this->call(PatientSeeder::class);
        $this->call(RoomSeeder::class);             // butuh Ward + Patient
        $this->call(PatientExaminationSeeder::class); // butuh Patient + Doctor
        $this->call(MedicineSeeder::class);          // butuh Patient
        $this->call(LabSeeder::class);               // butuh Patient
        $this->call(RadiologySeeder::class);          // butuh Patient + Doctor

        // Data IoT tanda-tanda vital & EWS (butuh Patient)
        $this->call(VitalSignSeeder::class);
        $this->call(EwsSeeder::class);
    }
}
