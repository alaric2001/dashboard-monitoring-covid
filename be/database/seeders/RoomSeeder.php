<?php

namespace Database\Seeders;

use App\Models\Room;
use Illuminate\Database\Seeder;

class RoomSeeder extends Seeder
{
    public function run(): void
    {
        // ward_id: 1=Bangsal COVID, 2=ICU, 3=HCU, 4=Isolasi, 5=Umum
        // patient_id: 1=Ahmad(severe), 2=Siti(critical), 3=Rizki(moderate),
        //             4=Nur(moderate), 5=Bambang(severe), 6=Dewi(mild),
        //             7=Wahyu(moderate), 8=Rini(mild)
        $rooms = [
            // ICU COVID-19 (ward 2) — pasien kritis/berat
            ['room_name' => 'ICU-01', 'ward_id' => 2, 'patient_id' => 2],
            ['room_name' => 'ICU-02', 'ward_id' => 2, 'patient_id' => 1],
            ['room_name' => 'ICU-03', 'ward_id' => 2, 'patient_id' => null],

            // HCU (ward 3) — pasien berat
            ['room_name' => 'HCU-01', 'ward_id' => 3, 'patient_id' => 5],
            ['room_name' => 'HCU-02', 'ward_id' => 3, 'patient_id' => null],
            ['room_name' => 'HCU-03', 'ward_id' => 3, 'patient_id' => null],

            // Bangsal COVID-19 (ward 1) — pasien sedang
            ['room_name' => 'COV-A01', 'ward_id' => 1, 'patient_id' => 3],
            ['room_name' => 'COV-A02', 'ward_id' => 1, 'patient_id' => 4],
            ['room_name' => 'COV-A03', 'ward_id' => 1, 'patient_id' => 7],
            ['room_name' => 'COV-A04', 'ward_id' => 1, 'patient_id' => null],

            // Bangsal Isolasi (ward 4) — pasien ringan
            ['room_name' => 'ISO-01',  'ward_id' => 4, 'patient_id' => 6],
            ['room_name' => 'ISO-02',  'ward_id' => 4, 'patient_id' => 8],
            ['room_name' => 'ISO-03',  'ward_id' => 4, 'patient_id' => null],

            // Bangsal Umum (ward 5) — kosong / observasi
            ['room_name' => 'UMU-01',  'ward_id' => 5, 'patient_id' => null],
            ['room_name' => 'UMU-02',  'ward_id' => 5, 'patient_id' => null],
            ['room_name' => 'UMU-03',  'ward_id' => 5, 'patient_id' => null],
        ];

        foreach ($rooms as $room) {
            Room::create($room);
        }
    }
}
