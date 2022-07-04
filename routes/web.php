<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Eventos;

Route::get('/', [Eventos::class, 'index']);

Route::get('/cadastro', function(){
    return view('cadastro');
});

Route::get('/painel', function(){
    return view('painel');
});
Route::get('/painel/pacientes', [Eventos::class, 'pacientes']);
Route::post('/painel/pacientes', [Eventos::class, 'salvar']);

Route::get('/painel/pacientes/atender/{id}', [Eventos::class, 'atender']);
Route::post('/painel/pacientes/atender/{id}', [Eventos::class, 'concluir']);

Route::get('/painel/atendimentos', function(){
    return view('atendimentos');
});