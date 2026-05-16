<?php

namespace Database\Seeders;

use App\Models\Nurse;
use Illuminate\Database\Seeder;

class NurseSeeder extends Seeder
{
    public function run(): void
    {
        $nurses = [
            [
                'name'       => 'Rina Kurniasih, S.Kep',
                'gender'     => 'Female',
                'birth_date' => '1990-02-14',
                'address'    => 'Jl. Pasteur No. 22, Bandung',
                'contact'    => '086789012345',
                'department' => 'ICU COVID-19',
            ],
            [
                'name'       => 'Agus Setiawan, S.Kep',
                'gender'     => 'Male',
                'birth_date' => '1988-06-20',
                'address'    => 'Jl. Kebon Jati No. 55, Bandung',
                'contact'    => '087890123456',
                'department' => 'Bangsal COVID-19',
            ],
            [
                'name'       => 'Yuni Rahmawati, S.Kep',
                'gender'     => 'Female',
                'birth_date' => '1993-10-07',
                'address'    => 'Jl. Cihampelas No. 80, Bandung',
                'contact'    => '088901234567',
                'department' => 'HCU',
            ],
            [
                'name'       => 'Doni Prasetyo, S.Kep',
                'gender'     => 'Male',
                'birth_date' => '1991-03-25',
                'address'    => 'Jl. Dipatiukur No. 13, Bandung',
                'contact'    => '089012345678',
                'department' => 'Bangsal Isolasi',
            ],
            [
                'name'       => 'Maya Lestari, S.Kep',
                'gender'     => 'Female',
                'birth_date' => '1995-08-11',
                'address'    => 'Jl. Ganesha No. 9, Bandung',
                'contact'    => '081123456789',
                'department' => 'Bangsal Umum',
            ],
        ];

        foreach ($nurses as $nurse) {
            Nurse::create($nurse);
        }
    }
}
