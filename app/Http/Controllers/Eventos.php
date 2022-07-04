<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pacientes;
use App\Models\Atendimentos;

use \LaravelLegends\PtBrValidator\Rules\FormatoCpf;

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

    public function salvar(Request $r){
        $event = new Pacientes;

        $event->nome = $r->nome;
        $event->cpf = str_replace(".","",str_replace("-","",$r->cpf));
        $event->wpp = str_replace(")","",str_replace("(","",str_replace("-","",$r->wpp)));
        $event->nasc = $r->nasc;

        if($r->hasFile("foto") && $r->file("foto")->isValid()){
            $permitidas = ["jpg","jpeg","png"];
            $foto = $r->foto;
            $extensao = $foto->extension();
            if(in_array($extensao,$permitidas)){
                $nomeFoto = uniqid().".$extensao";
                $foto->move(public_path("img/pacientes"),$nomeFoto);
                $event->foto = $nomeFoto;
            }else{
                return redirect('/painel/pacientes')->with('alert2','Formato de Imagem Não Permitido!');
            }
        }

        $event->save();
        return redirect('/painel/pacientes')->with('alert','Paciente Registrado!');
    }
    public function atender($id){
        //echo $id;

        $event = Pacientes::findOrFail($id);
        return view('atender',["event" => $event]);
    }
    public function concluir(Request $r,$id){
        //echo $id;

        $event = new Atendimentos;

        $event->sintomas = $r->sintomas;
        $event->lista = "$r->lista";
        $event->resultado = $r->resultado;
        $event->idPaciente = $r->idPaciente;

        $event->save();

        return redirect('/painel/pacientes')->with('alert3','Paciente Atendido!');

    }

}
