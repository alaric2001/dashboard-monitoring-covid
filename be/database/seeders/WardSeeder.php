<?php

namespace Database\Seeders;

use App\Models\Ward;
use Illuminate\Database\Seeder;

class WardSeeder extends Seeder
{
    public function run(): void
    {
        $wards = [
            [
                'ward_name'  => 'Bangsal COVID-19',
                'class'      => '1',
                'desc'       => 'Bangsal khusus perawatan pasien COVID-19 dengan protokol isolasi ketat.',
                'facilities' => 'Ventilator, monitor vital, oksigen sentral, nurse station 24 jam',
                'rates'      => 850000.00,
            ],
            [
                'ward_name'  => 'ICU COVID-19',
                'class'      => '1',
                'desc'       => 'Unit Perawatan Intensif untuk pasien COVID-19 kondisi kritis.',
                'facilities' => 'Ventilator ICU, ECMO, monitor multi-parameter, infus pump, nurse 1:1',
                'rates'      => 2500000.00,
            ],
            [
                'ward_name'  => 'HCU (High Care Unit)',
                'class'      => '1',
                'desc'       => 'Unit perawatan tingkat tinggi untuk pasien COVID-19 kondisi berat tidak kritis.',
                'facilities' => 'Monitor vital, oksigen HFNC, infus pump, nurse station',
                'rates'      => 1500000.00,
            ],
            [
                'ward_name'  => 'Bangsal Isolasi',
                'class'      => '2',
                'desc'       => 'Bangsal isolasi untuk pasien COVID-19 kondisi sedang.',
                'facilities' => 'Oksigen nasal kanul, monitor vital, kamar mandi dalam',
                'rates'      => 500000.00,
            ],
            [
                'ward_name'  => 'Bangsal Umum',
                'class'      => '3',
                'desc'       => 'Bangsal umum untuk pasien COVID-19 kondisi ringan dan observasi.',
                'facilities' => 'Oksigen portable, nurse station, fasilitas umum',
                'rates'      => 250000.00,
            ],
        ];

        foreach ($wards as $ward) {
            Ward::create($ward);
        }
    }
}
