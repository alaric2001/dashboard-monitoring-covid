<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::insert(
            array(
                [
                    "name" => "Admin",
                    "email" => "admin@gmail.com",
                    "role_id" => 1,
                    "password" => Hash::make(123)
                ],
                [
                    "name" => "Rumah Sakit",
                    "email" => "rumahsakit@gmail.com",
                    "role_id" => 2,
                    "password" => Hash::make(123)
                ],
            )
        );
    }
}