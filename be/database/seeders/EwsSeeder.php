<?php

namespace Database\Seeders;

use App\Models\Ews;
use Illuminate\Database\Seeder;

class EwsSeeder extends Seeder
{
    public function run(): void
    {
        // EWS (Early Warning Score): 0-1 green, 2-4 yellow, 5-6 orange, 7+ red
        $ewsData = [
            ['patient_id' => 1, 'patient_check' => 7, 'color' => 'red'],    // Ahmad — berat
            ['patient_id' => 2, 'patient_check' => 9, 'color' => 'red'],    // Siti — kritis
            ['patient_id' => 3, 'patient_check' => 4, 'color' => 'yellow'], // Rizki — sedang
            ['patient_id' => 4, 'patient_check' => 3, 'color' => 'yellow'], // Nur — sedang
            ['patient_id' => 5, 'patient_check' => 8, 'color' => 'red'],    // Bambang — berat
            ['patient_id' => 6, 'patient_check' => 1, 'color' => 'green'],  // Dewi — ringan
            ['patient_id' => 7, 'patient_check' => 5, 'color' => 'orange'], // Wahyu — sedang-berat
            ['patient_id' => 8, 'patient_check' => 1, 'color' => 'green'],  // Rini — ringan
        ];

        foreach ($ewsData as $ews) {
            Ews::create($ews);
        }
    }
}
