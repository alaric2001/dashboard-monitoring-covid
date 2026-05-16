<?php
namespace App\Action;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class LogoutAction
{

    public function execute (Request $request)
    {
        $request->user()?->currentAccessToken()->delete();
    }

}