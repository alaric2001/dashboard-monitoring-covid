<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;

class RoleController extends Controller
{
    public function index (Request $request)
    {
        $role = Role::get();
        // $role = Role::with(["users","permissions"])->get();
        return response()->json([ 
            "message" => "Success",
            "data"    => $role
        ]);
    }
}