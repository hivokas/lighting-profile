<?php

namespace App\Http\Requests\Me;

use Illuminate\Foundation\Http\FormRequest;

class UpdateFlatPartRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'brightness_percentage' => [
//                'nullable',
                'required',
                'integer',
                'between:0,100',
            ],
            'reacts_to_movements' => [
//                'nullable',
                'required',
                'boolean',
            ],
            'turn_off_timer' => [
//                'nullable',
                'required',
                'integer',
                'between:0,100000',
            ],
            'color' => [
//                'nullable',
                'required',
                'string',
            ],
        ];
    }
}
