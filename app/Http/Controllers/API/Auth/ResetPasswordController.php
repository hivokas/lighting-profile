<?php

namespace App\Http\Controllers\API\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;
use Illuminate\Foundation\Auth\ResetsPasswords;

class ResetPasswordController extends Controller
{
    use ResetsPasswords {
        sendResetResponse as baseSendResetResponse;
        sendResetFailedResponse as baseSendResetFailedResponse;
    }

    protected function sendResetResponse(Request $request, $response)
    {
        $this->baseSendResetResponse($request, $response);

        return response()->json([
            'message' => __($response),
        ]);
    }

    protected function sendResetFailedResponse(Request $request, $response)
    {
        $this->baseSendResetFailedResponse($request, $response);

        throw ValidationException::withMessages([
            'email' => [
                __($response),
            ],
        ]);
    }
}
