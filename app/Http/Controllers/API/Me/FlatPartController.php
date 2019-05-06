<?php

namespace App\Http\Controllers\API\Me;

use App\Http\Requests\Me\UpdateFlatPartRequest;
use App\Http\Resources\FlatPartResource;
use App\Models\FlatPart;
use App\Models\FlatPartUser;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FlatPartController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index(Request $request)
    {
        return FlatPartResource::collection(
            $request->user()->flatParts()->get()
        );
    }

    public function update(UpdateFlatPartRequest $request, FlatPart $flatPart)
    {
        /** @var User $user */
        $user = $request->user();

        $flatPartUser = FlatPartUser::query()
            ->where([
                'user_id' => $request->user()->id,
                'flat_part_id' => $flatPart->id,
            ])
            ->first();

        if (! $flatPartUser) {
            $flatPartUser = new FlatPartUser;
            $flatPartUser->user()->associate($request->user());
            $flatPartUser->flatPart()->associate($flatPart);
        }

        $flatPartUser->fill($request->validated());

        $flatPartUser->save();
    }

    public function destroy(Request $request, FlatPart $flatPart)
    {
        $request->user()->flatParts()->detach($flatPart);
    }
}
