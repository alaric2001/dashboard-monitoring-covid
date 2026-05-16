<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Doctor;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Doctor>
 */
class DoctorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->name,
            'gender' => $this->faker->randomElement(['Male', 'Female']),
            'birth_date' => $this->faker->date,
            'address' => $this->faker->address,
            'contact' => $this->faker->phoneNumber,
            'specialization' => $this->faker->randomElement(['Cardiology', 'Pediatrics', 'Orthopedics', 'Dermatology', 'Gastroenterology']),
        ];
    }
}
