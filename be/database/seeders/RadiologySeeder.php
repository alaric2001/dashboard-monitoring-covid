<?php

namespace Database\Seeders;

use App\Models\Radiology;
use Illuminate\Database\Seeder;

class RadiologySeeder extends Seeder
{
    public function run(): void
    {
        // doctor_id 4 = Dr. Dewi Puspita, Sp.Rad (Radiologi)
        $radiologies = [
            [
                'patient_id' => 1, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-01', 'processed_date' => '2023-08-01',
                'result' => 'Infiltrat bilateral di kedua lapang paru, gambaran ground glass opacity (+). Kesan: Pneumonia COVID-19 berat.',
            ],
            [
                'patient_id' => 1, 'doctor_id' => 4,
                'radiology_exam' => 'CT Scan Thorax dengan Kontras',
                'approved_date' => '2023-08-02', 'processed_date' => '2023-08-02',
                'result' => 'Ground glass opacity bilateral extensive, crazy-paving pattern (+). Keterlibatan >75% parenkim paru. Kesan: COVID-19 pneumonia kategori berat.',
            ],
            [
                'patient_id' => 2, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-02', 'processed_date' => '2023-08-02',
                'result' => 'Konsolidasi bilateral disertai air bronchogram, kardiomegali (+). Kesan: Pneumonia COVID-19 kritis disertai gagal jantung.',
            ],
            [
                'patient_id' => 2, 'doctor_id' => 4,
                'radiology_exam' => 'Ekokardiografi',
                'approved_date' => '2023-08-03', 'processed_date' => '2023-08-03',
                'result' => 'EF 40%, hipokinesis global. Terdapat tanda miokarditis. Konsul kardiologi direkomendasikan.',
            ],
            [
                'patient_id' => 3, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-03', 'processed_date' => '2023-08-03',
                'result' => 'Ground glass opacity bilateral ringan-sedang, predominan perifer. Kesan: Pneumonia COVID-19 sedang.',
            ],
            [
                'patient_id' => 4, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-05', 'processed_date' => '2023-08-05',
                'result' => 'Ground glass opacity bilateral ringan, tidak ada konsolidasi. Kesan: Pneumonia COVID-19 ringan-sedang.',
            ],
            [
                'patient_id' => 5, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-06', 'processed_date' => '2023-08-06',
                'result' => 'Infiltrat bilateral luas, ground glass opacity. Diafragma mendatar. Kesan: Pneumonia COVID-19 berat.',
            ],
            [
                'patient_id' => 6, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-07', 'processed_date' => '2023-08-07',
                'result' => 'Ground glass opacity minimal perifer bilateral. Tidak ada konsolidasi. Kesan: Pneumonia COVID-19 ringan.',
            ],
            [
                'patient_id' => 7, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-08', 'processed_date' => '2023-08-08',
                'result' => 'Ground glass opacity bilateral sedang, distribusi perifer. Kesan: Pneumonia COVID-19 sedang.',
            ],
            [
                'patient_id' => 8, 'doctor_id' => 4,
                'radiology_exam' => 'Rontgen Thorax AP',
                'approved_date' => '2023-08-09', 'processed_date' => '2023-08-09',
                'result' => 'Ground glass opacity minimal, hampir tidak tampak. Kesan: Pneumonia COVID-19 sangat ringan.',
            ],
        ];

        foreach ($radiologies as $radiology) {
            Radiology::create($radiology);
        }
    }
}
