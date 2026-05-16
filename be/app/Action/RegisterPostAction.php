<?php
namespace App\Action;

use App\Models\User;
use Illuminate\Http\Request;



class RegisterPostAction
{
    public function init (Request $request) : array|User
    {
        
        $data            = $request->validate([ 
            "username" => "required|unique:users,username",
            "email"    => "required|unique:users,email",
            "name"     => "required|max:100",
            "password" => "required|confirmed"
        ]);
        $data["role_id"] = 1;
        $user            = User::create($data);
        return $user;
    }


}