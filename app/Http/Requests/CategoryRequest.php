<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoryRequest extends FormRequest
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
            'name' => 'required|string|min:2|max:20',
        ];
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'name.required' => 'O nome de categoria é obrigatório.',
            'name.string' => 'O nome de categoria não é válido.',
            'name.min' => 'O nome de categoria precisa ter no mínimo 2 caracteres.',
            'name.max' => 'O nome de categoria precisa ter no máximo 20 caracteres.',
        ];
    }
}
