<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Patient;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Patient>
 */
class PatientFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $discharged = $this->faker->boolean;
        $nullDischarge = $discharged && $this->faker->boolean;

        return [
            'patient_name' => $this->faker->name,
            'admission_date' => $this->faker->dateTimeBetween('2020-01-01', '2023-12-31')->format('Y-m-d'),
            'discharge_date' => $discharged ? ($nullDischarge ? null : $this->faker->dateTimeBetween('2020-01-01', '2023-12-31')->format('Y-m-d')) : null,
            'gender' => $this->faker->randomElement(['Male', 'Female']),
            'birth' => $this->faker->date,
            'id_card' => $this->faker->numerify('################'),
            'address' => $this->faker->address,
            'contact' => $this->faker->phoneNumber,
            'education' => $this->faker->randomElement(['High School', 'College', 'University', 'Master']),
            'occupation' => $this->faker->jobTitle,
            'photo' => $this->faker->imageUrl(200, 200, 'people'),
            'referred' => $this->faker->randomElement(['Hospital A', 'Hospital B', 'Hospital C']),
            'next_of_kin_name' => $this->faker->name,
            'relationship' => $this->faker->randomElement(['Parent', 'Sibling', 'Spouse', 'Child', 'Other']),
            'next_of_kin_address' => $this->faker->address,
            'next_of_kin_contact' => $this->faker->phoneNumber,
        ];
        
        
        // return [
        //     'patient_name' => $this->faker->name,
        //     'admission_date' => $this->faker->date,
        //     'discharge_date' => $this->faker->date,
        //     'gender' => $this->faker->randomElement(['Male', 'Female']),
        //     'birth' => $this->faker->date,
        //     'id_card' => $this->faker->numerify('################'),
        //     'address' => $this->faker->address,
        //     'contact' => $this->faker->phoneNumber,
        //     'education' => $this->faker->randomElement(['High School', 'College', 'University', 'Master']),
        //     'occupation' => $this->faker->jobTitle,
        //     'photo' => $this->faker->imageUrl(200, 200, 'people'),
        //     'referred' => $this->faker->randomElement(['Hospital A', 'Hospital B', 'Hospital C']),
        //     'next_of_kin_name' => $this->faker->name,
        //     'relationship' => $this->faker->randomElement(['Parent', 'Sibling', 'Spouse', 'Child', 'Other']),
        //     'next_of_kin_address' => $this->faker->address,
        //     'next_of_kin_contact' => $this->faker->phoneNumber,
        // ];
    }
}
