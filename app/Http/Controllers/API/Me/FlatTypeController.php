<?php

namespace App\Http\Controllers\API\Me;

use App\Http\Resources\FlatTypeResource;
use App\Http\Controllers\Controller;
use App\Models\FlatType;
use App\Models\User;
use Illuminate\Http\Request;

class FlatTypeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index(Request $request)
    {
        return FlatTypeResource::collection(
            $request->user()->flatTypes()->get()->load('flatParts')
        );
    }

    public function update(Request $request, FlatType $flatType)
    {
        $flatType->users()->attach($request->user());
    }

    public function destroy(Request $request, FlatType $flatType)
    {
        // clearing info
        foreach ($flatType->flatParts as $flatPart) {
            $request->user()->flatParts()->detach($flatPart);
        }

        $flatType->users()->detach($request->user());
    }
}
