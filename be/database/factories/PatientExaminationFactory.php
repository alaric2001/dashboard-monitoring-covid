<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\PatientExamination;
use App\Models\Patient;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Patient>
 */
class PatientExaminationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'weight' => $this->faker->numberBetween(40, 120),
            'height' => $this->faker->numberBetween(140, 200),
            'blood' => $this->faker->randomElement(['A', 'B', 'AB', 'O']) . $this->faker->randomElement(['+', '-']), // Contoh: "A+" atau "B-"
            'notes' => $this->faker->sentence($nbWords = $this->faker->numberBetween(1, 7)),
            'patient_id' => $this->faker->unique()->numberBetween(1, 50),
            'doctor_id' => $this->faker->numberBetween(1, 15),
            'covid_case' => $this->faker->boolean,
            // 'notes' => $this->faker->text,
        ];
    }
}
