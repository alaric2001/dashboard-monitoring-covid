<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run () : void
    {
        $role = Role::create([ 
            "name" => "Administrator"
        ]);

        $role->permissions()->sync([ 1, 2 ]);
        $role = Role::create([ 
            "name" => "Rumah Sakit"
        ]);

        $role->permissions()->sync([ 2 ]);

    }
}