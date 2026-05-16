<?php

namespace App\Http\Controllers\Auth;

use App\Action\LogoutAction;
use Illuminate\Http\Request;
use App\Action\LoginPostAction;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    public function index (Request $request, LoginPostAction $loginPostAction)
    {
        try
        {
            return response()->json([ 'token' => $loginPostAction->init($request) ]);
        }
        catch (\Throwable $th)
        {
            return response()->json(data: [ "message" => $th->getMessage() ], status: 500);
        }
    }
    public function authValidate(Request $request){
        return $request->user();
    }
    public function logout (Request $request, LogoutAction $logoutAction)
    {
        try
        {
            $logoutAction->execute($request);
            return response()->json([ 'message' => 'Logged out successfully' ]);
        }
        catch (\Throwable $th)
        {
            return response()->json([ 'message' => $th->getMessage() ], 500);
        }
    }
}