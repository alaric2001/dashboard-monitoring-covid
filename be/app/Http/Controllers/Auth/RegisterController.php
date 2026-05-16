<?php

namespace App\Http\Controllers\Auth;

use App\Action\RegisterPostAction;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RegisterController extends Controller
{
    public function index (Request $request, RegisterPostAction $registerPostAction)
    {
        
        try
        {
            return response()->json([ 'user' => $registerPostAction->init($request) ]);
        }
        catch (\Throwable $th)
        {
            return response()->json(data: [ "message" => $th->getMessage() ], status: 500);
        }
    }
}