<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Ward;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Ward>
 */
class WardFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'ward_name' => $this->faker->word,
            'class' => $this->faker->numberBetween(1, 5),
            'desc' => $this->faker->sentence,
            'facilities' => $this->faker->sentence,
            'rates' => $this->faker->randomFloat(2, 100000, 4000000),
        ];
    }
}
