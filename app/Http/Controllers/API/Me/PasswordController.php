<?php

namespace App\Http\Controllers\API\Me;

use App\Http\Requests\Password\UpdatePasswordRequest;
use App\Models\User;
use App\Http\Controllers\Controller;

class PasswordController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function update(UpdatePasswordRequest $request)
    {
        /** @var User $user */
        $user = $request->user();

        $user->update($request->validated());
    }
}
