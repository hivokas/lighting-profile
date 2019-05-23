<?php

namespace App\Http\Controllers\API\Me;

use App\Http\Requests\Account\UpdateAccountRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

class AccountController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function show(Request $request)
    {
        /** @var User $user */
        $user = QueryBuilder::for(User::class)
            ->where('id', $request->user()->id)
            ->first();

        return new UserResource($user);
    }

    public function update(UpdateAccountRequest $request)
    {
        /** @var User $user */
        $user = $request->user();

        $user->update($request->validated());

        return new UserResource($user);
    }
}
