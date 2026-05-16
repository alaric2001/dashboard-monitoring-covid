<?php

namespace Database\Seeders;

use App\Models\PatientExamination;
use Illuminate\Database\Seeder;

class PatientExaminationSeeder extends Seeder
{
    public function run(): void
    {
        // patient_id 1-8, doctor_id 1-5
        $examinations = [
            [
                'patient_id' => 1, 'doctor_id' => 1,
                'weight' => 72, 'height' => 170, 'blood' => 'O+',
                'covid_case' => true,
                'notes' => 'Pasien mengalami sesak napas berat, saturasi oksigen turun signifikan. Perlu monitoring ketat.',
            ],
            [
                'patient_id' => 2, 'doctor_id' => 5,
                'weight' => 58, 'height' => 155, 'blood' => 'A+',
                'covid_case' => true,
                'notes' => 'Pasien lansia kondisi kritis. Komorbiditas diabetes dan hipertensi. Pasang ventilator.',
            ],
            [
                'patient_id' => 3, 'doctor_id' => 2,
                'weight' => 68, 'height' => 175, 'blood' => 'B+',
                'covid_case' => true,
                'notes' => 'Pasien muda, kondisi sedang. Oksigen tambahan via nasal kanul. Prognosis baik.',
            ],
            [
                'patient_id' => 4, 'doctor_id' => 2,
                'weight' => 55, 'height' => 160, 'blood' => 'AB+',
                'covid_case' => true,
                'notes' => 'Kondisi sedang, demam persisten. Respon terapi antipiretik cukup baik.',
            ],
            [
                'patient_id' => 5, 'doctor_id' => 1,
                'weight' => 85, 'height' => 168, 'blood' => 'O-',
                'covid_case' => true,
                'notes' => 'Pasien berat badan berlebih, kondisi berat. Komorbiditas obesitas memperburuk kondisi.',
            ],
            [
                'patient_id' => 6, 'doctor_id' => 2,
                'weight' => 52, 'height' => 158, 'blood' => 'A-',
                'covid_case' => true,
                'notes' => 'Kondisi ringan, tidak memerlukan oksigen tambahan. Target pulang 3-5 hari.',
            ],
            [
                'patient_id' => 7, 'doctor_id' => 1,
                'weight' => 76, 'height' => 172, 'blood' => 'B-',
                'covid_case' => true,
                'notes' => 'Kondisi sedang, demam dan batuk produktif. Respon terapi antiviral baik.',
            ],
            [
                'patient_id' => 8, 'doctor_id' => 2,
                'weight' => 50, 'height' => 162, 'blood' => 'O+',
                'covid_case' => true,
                'notes' => 'Kondisi ringan, gejala utama anosmia dan batuk kering. Saturasi oksigen stabil.',
            ],
        ];

        foreach ($examinations as $exam) {
            PatientExamination::create($exam);
        }
    }
}
