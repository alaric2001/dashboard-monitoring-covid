<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index (Request $request)
    {
        try
        {
            $user = User::with([ "role.permissions" ])->get();
            return response()->json([ 
                "message" => "Success",
                "data"    => $user,
            ]);
        }
        catch (\Throwable $e)
        {
            return response()->json([ 
                "message" => $e->getMessage(),
                "code"    => $e->getCode()
            ]);
        }

    }
    public function submit (Request $request)
    {
    
        $request->validate([
            "email"=>"required|email|unique:users,email",
            "name"=>"required",
            "password"=>"confirmed|required"
        ]);
            $user = User::create([ 
                "name"     => $request->name,
                "email"    => $request->email,
                "password" => Hash::make($request->password),
                "role_id"  => $request->role_id
            ]);
            return response()->json([ 
                "message" => "Success",
                "data"    => $user
            ]);
        
    }
    public function destroy (User $user)
    {
        try
        {
            $user->delete();
            return response()->json([ "data" => $user, "success" => "OK" ], 200);
        }
        catch (\Throwable $th)
        {
            return response()->json([ "message" => $th->getMessage() ], $th->getCode());
        }
    }
    public function show (User $user)
    {
        return response()->json([ 'data' => $user->load('role') ], 200);
    }
    public function update (Request $request, User $user)
    {
        $request->validate([ 
            "name" => "required"
        ]);
        $user->update([ 
            "name"    => $request->name,
            "role_id" => $request->role_id
        ]);
        return response()->json([ 'data' => $user->load('role') ], 200);
    }
}