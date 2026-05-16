<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class VitalSignSeeder extends Seeder
{
    public function run(): void
    {
        // 10 pembacaan per pasien, setiap 4 jam mulai dari 2023-08-15 00:00
        // Nilai menunjukkan tren klinis: kritis stabil/fluktuatif, ringan menurun (membaik)
        $vitalData = [
            1 => [ // Ahmad Hidayat — berat (tren membaik)
                'hr'   => [118, 115, 113, 116, 112, 108, 105, 102, 98, 95],
                'rr'   => [26, 25, 25, 24, 23, 22, 21, 21, 20, 19],
                'spo2' => [89, 90, 90, 91, 91, 92, 93, 93, 94, 94],
                'temp' => [39.2, 39.0, 38.8, 38.7, 38.5, 38.3, 38.1, 37.9, 37.8, 37.6],
                'sys'  => [145, 143, 141, 139, 137, 135, 133, 131, 129, 128],
                'dia'  => [95, 93, 91, 90, 88, 87, 85, 84, 83, 82],
            ],
            2 => [ // Siti Aminah — kritis (fluktuatif)
                'hr'   => [132, 128, 135, 130, 125, 133, 127, 131, 128, 130],
                'rr'   => [32, 30, 31, 29, 32, 30, 28, 31, 30, 29],
                'spo2' => [86, 88, 85, 87, 89, 86, 88, 87, 90, 89],
                'temp' => [40.1, 39.8, 40.2, 40.0, 39.7, 39.9, 40.1, 39.8, 39.6, 39.9],
                'sys'  => [155, 158, 152, 160, 156, 153, 158, 155, 150, 157],
                'dia'  => [100, 102, 98, 105, 101, 99, 103, 100, 97, 102],
            ],
            3 => [ // Rizki Pradipta — sedang (tren membaik)
                'hr'   => [98, 96, 97, 95, 94, 96, 93, 94, 92, 91],
                'rr'   => [22, 21, 22, 20, 21, 20, 19, 20, 19, 18],
                'spo2' => [93, 93, 92, 94, 93, 94, 95, 94, 95, 95],
                'temp' => [38.5, 38.4, 38.2, 38.1, 38.0, 37.9, 37.8, 37.7, 37.6, 37.5],
                'sys'  => [128, 126, 127, 125, 124, 123, 122, 121, 120, 119],
                'dia'  => [84, 83, 83, 82, 81, 80, 80, 79, 79, 78],
            ],
            4 => [ // Nur Fadilah — sedang (tren membaik)
                'hr'   => [92, 90, 91, 89, 90, 88, 87, 88, 86, 85],
                'rr'   => [21, 20, 21, 19, 20, 19, 18, 19, 18, 17],
                'spo2' => [94, 94, 93, 95, 94, 95, 95, 96, 95, 96],
                'temp' => [38.3, 38.1, 38.0, 37.9, 37.8, 37.7, 37.6, 37.5, 37.4, 37.3],
                'sys'  => [122, 120, 121, 119, 118, 117, 118, 116, 115, 115],
                'dia'  => [80, 79, 80, 78, 77, 76, 77, 76, 75, 75],
            ],
            5 => [ // Bambang Suryanto — berat (tren membaik lambat)
                'hr'   => [121, 118, 120, 116, 115, 117, 113, 115, 112, 110],
                'rr'   => [28, 26, 27, 25, 26, 24, 25, 23, 24, 22],
                'spo2' => [88, 89, 88, 90, 89, 91, 90, 92, 91, 92],
                'temp' => [39.5, 39.3, 39.1, 39.0, 38.8, 38.7, 38.5, 38.4, 38.2, 38.1],
                'sys'  => [148, 146, 144, 142, 140, 138, 137, 135, 134, 132],
                'dia'  => [97, 95, 94, 92, 91, 90, 89, 88, 87, 85],
            ],
            6 => [ // Dewi Anggraini — ringan (stabil menuju normal)
                'hr'   => [82, 81, 83, 80, 81, 79, 80, 78, 79, 78],
                'rr'   => [18, 17, 18, 17, 16, 17, 16, 16, 15, 15],
                'spo2' => [96, 96, 95, 97, 96, 97, 97, 96, 97, 98],
                'temp' => [37.8, 37.7, 37.6, 37.5, 37.4, 37.3, 37.2, 37.2, 37.1, 37.0],
                'sys'  => [118, 117, 118, 116, 115, 116, 114, 115, 113, 112],
                'dia'  => [76, 75, 76, 74, 73, 74, 73, 72, 72, 71],
            ],
            7 => [ // Wahyu Hidayatullah — sedang (tren membaik)
                'hr'   => [100, 98, 99, 97, 96, 97, 95, 96, 94, 93],
                'rr'   => [23, 22, 22, 21, 21, 20, 20, 19, 19, 18],
                'spo2' => [92, 92, 93, 92, 93, 94, 93, 94, 95, 94],
                'temp' => [38.6, 38.4, 38.3, 38.1, 38.0, 37.9, 37.8, 37.7, 37.6, 37.5],
                'sys'  => [130, 128, 129, 127, 126, 125, 124, 123, 122, 121],
                'dia'  => [85, 84, 84, 83, 82, 81, 80, 80, 79, 79],
            ],
            8 => [ // Rini Susanti — ringan (hampir normal)
                'hr'   => [78, 77, 78, 76, 77, 75, 76, 74, 75, 74],
                'rr'   => [17, 16, 17, 16, 15, 16, 15, 15, 14, 14],
                'spo2' => [97, 97, 96, 98, 97, 98, 97, 98, 98, 97],
                'temp' => [37.5, 37.4, 37.4, 37.3, 37.2, 37.2, 37.1, 37.1, 37.0, 37.0],
                'sys'  => [115, 114, 115, 113, 112, 113, 111, 112, 110, 110],
                'dia'  => [73, 72, 73, 71, 70, 71, 70, 69, 69, 68],
            ],
        ];

        $baseTime = Carbon::parse('2023-08-15 00:00:00');

        foreach ($vitalData as $patientId => $data) {
            $hrRows = $rrRows = $spo2Rows = $tempRows = $nibpRows = [];

            for ($i = 0; $i < 10; $i++) {
                $ts = $baseTime->copy()->addHours($i * 4)->toDateTimeString();

                $hrRows[] = [
                    'patient_id'    => $patientId,
                    'heart_beats'   => $data['hr'][$i],
                    'patient_check' => 0,
                    'created_at'    => $ts,
                    'updated_at'    => $ts,
                ];
                $rrRows[] = [
                    'patient_id'    => $patientId,
                    'breaths'       => $data['rr'][$i],
                    'patient_check' => 0,
                    'created_at'    => $ts,
                    'updated_at'    => $ts,
                ];
                $spo2Rows[] = [
                    'patient_id'    => $patientId,
                    'blood_oxygen'  => $data['spo2'][$i],
                    'patient_check' => 0,
                    'created_at'    => $ts,
                    'updated_at'    => $ts,
                ];
                $tempRows[] = [
                    'patient_id'    => $patientId,
                    'patient_temp'  => $data['temp'][$i],
                    'patient_check' => 0,
                    'created_at'    => $ts,
                    'updated_at'    => $ts,
                ];
                $nibpRows[] = [
                    'patient_id'    => $patientId,
                    'systolic'      => $data['sys'][$i],
                    'diastolic'     => $data['dia'][$i],
                    'patient_check' => 0,
                    'created_at'    => $ts,
                    'updated_at'    => $ts,
                ];
            }

            DB::table('heart_rate')->insert($hrRows);
            DB::table('respiration_rate')->insert($rrRows);
            DB::table('spo2')->insert($spo2Rows);
            DB::table('temperature')->insert($tempRows);
            DB::table('nibp')->insert($nibpRows);
        }
    }
}
