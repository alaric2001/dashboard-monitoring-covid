<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Room;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Room>
 */
class RoomFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    protected $model = Room::class;
    
    public function definition(): array
    {
        $wardId = $this->faker->numberBetween(1, 10); // Assuming you have 10 wards
        $roomNumber = $this->generateUniqueRoomNumber($wardId);
        $roomName = "{$wardId}-{$roomNumber}";
        static $patientId = 1;

        return [
            'room_name' => $roomName,
            // 'patient_id' => $this->faker->numberBetween(1, 50), // Unique patient IDs between 1 and 50
            'patient_id' =>$patientId++,
            'ward_id' => $wardId,
        ];
    }

    protected function generateUniqueRoomNumber($wardId)
    {
        $maxRetries = 10000;
        $retries = 0;

        do {
            $roomNumber = $this->faker->unique()->numberBetween(1, 600); // Increase the range to 1-600
            $retries++;
        } while ($this->model::where('room_name', "{$wardId}-{$roomNumber}")->exists() && $retries <= $maxRetries);

        if ($retries > $maxRetries) {
            throw new \Exception("Maximum retries reached without finding a unique room number.");
        }

        return $roomNumber;
    }
}
