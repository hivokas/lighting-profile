<?php

namespace App\Http\Controllers\API\Auth;

use App\Http\Requests\RegisterRequest;
use App\Models\User;
use App\Http\Controllers\Controller;

class RegisterController extends Controller
{
    public function register(RegisterRequest $request)
    {
        /** @var User $user */
        $user = User::create($request->only(['name', 'email', 'password']));

        return response()->json([
            'message' => __('Account has been registered successfully.'),
            'data' => [
                'access_token' => $user->createToken('app')->accessToken,
            ],
        ]);
    }
}
