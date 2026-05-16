<?php

namespace Database\Seeders;

use App\Models\Lab;
use Illuminate\Database\Seeder;

class LabSeeder extends Seeder
{
    public function run(): void
    {
        $labs = [
            // Pasien 1 — Ahmad Hidayat
            [
                'patient_id' => 1, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-01', 'dispatch_to_lab_date' => '2023-08-01',
                'sample_received_date' => '2023-08-01', 'processed_date' => '2023-08-02',
            ],
            [
                'patient_id' => 1, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'D-Dimer', 'result' => '3.2 mg/L (Meningkat)',
                'sample_collection_date' => '2023-08-01', 'dispatch_to_lab_date' => '2023-08-01',
                'sample_received_date' => '2023-08-01', 'processed_date' => '2023-08-01',
            ],
            [
                'patient_id' => 1, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'CRP (C-Reactive Protein)', 'result' => '85 mg/L (Meningkat)',
                'sample_collection_date' => '2023-08-01', 'dispatch_to_lab_date' => '2023-08-01',
                'sample_received_date' => '2023-08-01', 'processed_date' => '2023-08-01',
            ],

            // Pasien 2 — Siti Aminah (kritis)
            [
                'patient_id' => 2, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-02', 'dispatch_to_lab_date' => '2023-08-02',
                'sample_received_date' => '2023-08-02', 'processed_date' => '2023-08-03',
            ],
            [
                'patient_id' => 2, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'Troponin I', 'result' => '0.42 ng/mL (Meningkat Signifikan)',
                'sample_collection_date' => '2023-08-02', 'dispatch_to_lab_date' => '2023-08-02',
                'sample_received_date' => '2023-08-02', 'processed_date' => '2023-08-02',
            ],
            [
                'patient_id' => 2, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'Ferritin', 'result' => '1250 ng/mL (Meningkat)',
                'sample_collection_date' => '2023-08-02', 'dispatch_to_lab_date' => '2023-08-02',
                'sample_received_date' => '2023-08-02', 'processed_date' => '2023-08-02',
            ],

            // Pasien 3 — Rizki Pradipta
            [
                'patient_id' => 3, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-03', 'dispatch_to_lab_date' => '2023-08-03',
                'sample_received_date' => '2023-08-03', 'processed_date' => '2023-08-04',
            ],
            [
                'patient_id' => 3, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'Darah Lengkap (CBC)', 'result' => 'Leukosit 11.200/uL, Limfosit 18%',
                'sample_collection_date' => '2023-08-03', 'dispatch_to_lab_date' => '2023-08-03',
                'sample_received_date' => '2023-08-03', 'processed_date' => '2023-08-03',
            ],

            // Pasien 4 — Nur Fadilah
            [
                'patient_id' => 4, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-05', 'dispatch_to_lab_date' => '2023-08-05',
                'sample_received_date' => '2023-08-05', 'processed_date' => '2023-08-06',
            ],
            [
                'patient_id' => 4, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'CRP (C-Reactive Protein)', 'result' => '42 mg/L (Meningkat Sedang)',
                'sample_collection_date' => '2023-08-05', 'dispatch_to_lab_date' => '2023-08-05',
                'sample_received_date' => '2023-08-05', 'processed_date' => '2023-08-05',
            ],

            // Pasien 5 — Bambang Suryanto
            [
                'patient_id' => 5, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-06', 'dispatch_to_lab_date' => '2023-08-06',
                'sample_received_date' => '2023-08-06', 'processed_date' => '2023-08-07',
            ],
            [
                'patient_id' => 5, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'D-Dimer', 'result' => '2.8 mg/L (Meningkat)',
                'sample_collection_date' => '2023-08-06', 'dispatch_to_lab_date' => '2023-08-06',
                'sample_received_date' => '2023-08-06', 'processed_date' => '2023-08-06',
            ],

            // Pasien 6 — Dewi Anggraini
            [
                'patient_id' => 6, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-07', 'dispatch_to_lab_date' => '2023-08-07',
                'sample_received_date' => '2023-08-07', 'processed_date' => '2023-08-08',
            ],
            [
                'patient_id' => 6, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'Darah Lengkap (CBC)', 'result' => 'Dalam batas normal',
                'sample_collection_date' => '2023-08-07', 'dispatch_to_lab_date' => '2023-08-07',
                'sample_received_date' => '2023-08-07', 'processed_date' => '2023-08-07',
            ],

            // Pasien 7 — Wahyu Hidayatullah
            [
                'patient_id' => 7, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-08', 'dispatch_to_lab_date' => '2023-08-08',
                'sample_received_date' => '2023-08-08', 'processed_date' => '2023-08-09',
            ],
            [
                'patient_id' => 7, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'Procalcitonin', 'result' => '0.8 ng/mL (Meningkat Ringan)',
                'sample_collection_date' => '2023-08-08', 'dispatch_to_lab_date' => '2023-08-08',
                'sample_received_date' => '2023-08-08', 'processed_date' => '2023-08-08',
            ],

            // Pasien 8 — Rini Susanti
            [
                'patient_id' => 8, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'RT-PCR SARS-CoV-2', 'result' => 'Positif',
                'sample_collection_date' => '2023-08-09', 'dispatch_to_lab_date' => '2023-08-09',
                'sample_received_date' => '2023-08-09', 'processed_date' => '2023-08-10',
            ],
            [
                'patient_id' => 8, 'lab_name' => 'Laboratorium Klinik RS Telkom',
                'test_type' => 'Darah Lengkap (CBC)', 'result' => 'Dalam batas normal',
                'sample_collection_date' => '2023-08-09', 'dispatch_to_lab_date' => '2023-08-09',
                'sample_received_date' => '2023-08-09', 'processed_date' => '2023-08-09',
            ],
        ];

        foreach ($labs as $lab) {
            Lab::create($lab);
        }
    }
}
