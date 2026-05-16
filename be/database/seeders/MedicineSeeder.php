<?php

namespace Database\Seeders;

use App\Models\Medicine;
use Illuminate\Database\Seeder;

class MedicineSeeder extends Seeder
{
    public function run(): void
    {
        // Protokol obat COVID-19 per pasien (patient_id 1-8)
        $medicines = [
            // Pasien 1 — Ahmad Hidayat (berat)
            ['patient_id' => 1, 'name' => 'Remdesivir 100mg', 'type' => 'Antiviral', 'stock' => 10],
            ['patient_id' => 1, 'name' => 'Dexamethasone 6mg', 'type' => 'Kortikosteroid', 'stock' => 14],
            ['patient_id' => 1, 'name' => 'Vitamin C 1000mg', 'type' => 'Suplemen', 'stock' => 30],

            // Pasien 2 — Siti Aminah (kritis)
            ['patient_id' => 2, 'name' => 'Remdesivir 100mg', 'type' => 'Antiviral', 'stock' => 10],
            ['patient_id' => 2, 'name' => 'Methylprednisolone 125mg', 'type' => 'Kortikosteroid', 'stock' => 14],
            ['patient_id' => 2, 'name' => 'Heparin 5000 IU', 'type' => 'Antikoagulan', 'stock' => 14],

            // Pasien 3 — Rizki Pradipta (sedang)
            ['patient_id' => 3, 'name' => 'Favipiravir 200mg', 'type' => 'Antiviral', 'stock' => 28],
            ['patient_id' => 3, 'name' => 'Dexamethasone 6mg', 'type' => 'Kortikosteroid', 'stock' => 10],
            ['patient_id' => 3, 'name' => 'Zinc 20mg', 'type' => 'Suplemen', 'stock' => 14],

            // Pasien 4 — Nur Fadilah (sedang)
            ['patient_id' => 4, 'name' => 'Favipiravir 200mg', 'type' => 'Antiviral', 'stock' => 28],
            ['patient_id' => 4, 'name' => 'Paracetamol 500mg', 'type' => 'Antipiretik', 'stock' => 30],
            ['patient_id' => 4, 'name' => 'Vitamin D3 1000 IU', 'type' => 'Suplemen', 'stock' => 14],

            // Pasien 5 — Bambang Suryanto (berat)
            ['patient_id' => 5, 'name' => 'Remdesivir 100mg', 'type' => 'Antiviral', 'stock' => 10],
            ['patient_id' => 5, 'name' => 'Dexamethasone 6mg', 'type' => 'Kortikosteroid', 'stock' => 14],
            ['patient_id' => 5, 'name' => 'Levofloxacin 750mg', 'type' => 'Antibiotik', 'stock' => 7],

            // Pasien 6 — Dewi Anggraini (ringan)
            ['patient_id' => 6, 'name' => 'Paracetamol 500mg', 'type' => 'Antipiretik', 'stock' => 30],
            ['patient_id' => 6, 'name' => 'Vitamin C 500mg', 'type' => 'Suplemen', 'stock' => 30],
            ['patient_id' => 6, 'name' => 'Zinc 20mg', 'type' => 'Suplemen', 'stock' => 14],

            // Pasien 7 — Wahyu Hidayatullah (sedang)
            ['patient_id' => 7, 'name' => 'Favipiravir 200mg', 'type' => 'Antiviral', 'stock' => 28],
            ['patient_id' => 7, 'name' => 'Azithromycin 500mg', 'type' => 'Antibiotik', 'stock' => 5],
            ['patient_id' => 7, 'name' => 'NAC (N-Acetylcysteine) 600mg', 'type' => 'Mukolitik', 'stock' => 14],

            // Pasien 8 — Rini Susanti (ringan)
            ['patient_id' => 8, 'name' => 'Paracetamol 500mg', 'type' => 'Antipiretik', 'stock' => 30],
            ['patient_id' => 8, 'name' => 'Vitamin D3 1000 IU', 'type' => 'Suplemen', 'stock' => 14],
            ['patient_id' => 8, 'name' => 'Zinc 20mg', 'type' => 'Suplemen', 'stock' => 14],
        ];

        foreach ($medicines as $medicine) {
            Medicine::create($medicine);
        }
    }
}
