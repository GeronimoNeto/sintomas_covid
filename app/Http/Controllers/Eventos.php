<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pacientes;

class Eventos extends Controller
{
    public function index(){
        $pacientes = Pacientes::all();

        return view('login',
            [
                "pacientes" => $pacientes
            ]
        );
    }

    public function pacientes(){
        $pacientes = Pacientes::all();

        return view('pacientes',
            [
                "pacientes" => $pacientes
            ]
        );
    }
}
