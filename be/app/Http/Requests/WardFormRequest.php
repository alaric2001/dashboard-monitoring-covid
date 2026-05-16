<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class WardFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize () : bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules () : array
    {
        return [ 
            'no_room'         => 'required|string',
            'room_name'       => 'required|string',
            'room_desc'       => 'nullable|string',
            'facilities'      => 'nullable|string',
            'room_rates'      => 'required|numeric|min:0',
            'available_rooms' => 'integer|min:0',
        ];
    }
}