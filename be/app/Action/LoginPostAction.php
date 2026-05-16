<?php
namespace App\Action;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;



class LoginPostAction
{
    public function init (Request $request) : array|ValidationException
    {
        $request->validate([ 
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');

        if ( Auth::attempt($credentials) )
        {
            $user  = Auth::user();
            $token = $user->createToken('auth-token')
                ->plainTextToken;

            $accessToken             = $user->tokens()->where('name', 'auth-token')->first();
            $accessToken->expires_at = now()->addDays(7); 
            $accessToken->save();

            return [ 
                'access_token' => $token,
                'token_type'   => 'Bearer',
                'expires_in'   => $accessToken->expires_at
            ];
        }

        throw ValidationException::withMessages([ 
            'email' => 'Invalid credentials',
        ]);
    }


}