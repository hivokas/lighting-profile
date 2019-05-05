<?php

namespace App\Http\Controllers\API\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;

class ForgotPasswordController extends Controller
{
    use SendsPasswordResetEmails {
        sendResetLinkResponse as baseSendResetLinkResponse;
        sendResetLinkFailedResponse as baseSendResetLinkFailedResponse;
    }

    protected function sendResetLinkResponse(Request $request, $response)
    {
        $this->baseSendResetLinkResponse($request, $response);

        return response()->json([
            'message' => __($response),
        ]);
    }

    protected function sendResetLinkFailedResponse(Request $request, $response)
    {
        $this->baseSendResetLinkFailedResponse($request, $response);

        throw ValidationException::withMessages([
            'email' => [
                __($response),
            ],
        ]);
    }
}
