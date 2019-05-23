<?php

namespace App\Http\Controllers\API;

use App\Http\Resources\FlatTypeResource;
use App\Models\FlatType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FlatTypeController extends Controller
{
    public function index()
    {
        return FlatTypeResource::collection(
            FlatType::with(['flatParts'])->get()
        );
    }

    public function show(FlatType $flatType)
    {
        return new FlatTypeResource($flatType->load('flatParts'));
    }
}
