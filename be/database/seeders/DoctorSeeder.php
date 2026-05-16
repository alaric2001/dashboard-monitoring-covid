<?php

namespace Database\Seeders;

use App\Models\Doctor;
use Illuminate\Database\Seeder;

class DoctorSeeder extends Seeder
{
    public function run(): void
    {
        $doctors = [
            [
                'name'           => 'Dr. Budi Santoso, Sp.P',
                'gender'         => 'Male',
                'birth_date'     => '1975-03-12',
                'address'        => 'Jl. Raya Dago No. 45, Bandung',
                'contact'        => '081234567890',
                'specialization' => 'Pulmonologi',
            ],
            [
                'name'           => 'Dr. Siti Rahayu, Sp.PD',
                'gender'         => 'Female',
                'birth_date'     => '1980-07-28',
                'address'        => 'Jl. Ciumbuleuit No. 112, Bandung',
                'contact'        => '082345678901',
                'specialization' => 'Penyakit Dalam',
            ],
            [
                'name'           => 'Dr. Ahmad Fauzi, Sp.JP',
                'gender'         => 'Male',
                'birth_date'     => '1972-11-05',
                'address'        => 'Jl. Sukajadi No. 88, Bandung',
                'contact'        => '083456789012',
                'specialization' => 'Jantung dan Pembuluh Darah',
            ],
            [
                'name'           => 'Dr. Dewi Puspita, Sp.Rad',
                'gender'         => 'Female',
                'birth_date'     => '1983-04-19',
                'address'        => 'Jl. Setiabudi No. 67, Bandung',
                'contact'        => '084567890123',
                'specialization' => 'Radiologi',
            ],
            [
                'name'           => 'Dr. Hendra Wijaya, Sp.An',
                'gender'         => 'Male',
                'birth_date'     => '1978-09-03',
                'address'        => 'Jl. Tubagus Ismail No. 30, Bandung',
                'contact'        => '085678901234',
                'specialization' => 'Anestesiologi dan Terapi Intensif',
            ],
        ];

        foreach ($doctors as $doctor) {
            Doctor::create($doctor);
        }
    }
}
