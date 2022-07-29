<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pacientes;
use App\Models\Atendimentos;
use Illuminate\Support\Facades\DB;
use \LaravelLegends\PtBrValidator\Rules\FormatoCpf;

class Eventos extends Controller
{
    public function index(){
        $pacientes = Pacientes::all();
        
        return redirect('/painel');
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
        //return redirect('/painel/pacientes/novo');
        
        $event = new Pacientes;
        $cpf = str_replace(".","",str_replace("-","",$r->cpf));

        $event->nome = $r->nome;
        $event->cpf = $cpf;
        $event->wpp = str_replace(")","",str_replace("(","",str_replace("-","",$r->wpp)));
        $event->nasc = $r->nasc;
        $event->estado = 3;
        
        if($r->hasFile("foto") && $r->file("foto")->isValid()){
            $permitidas = ["jpg","png"];
            $foto = $r->foto;
            $extensao = $foto->extension();
            if(in_array($extensao,$permitidas)){
                $nomeFoto = $cpf.".$extensao";
                $foto->move(public_path("img/pacientes"),$nomeFoto);
                $event->foto = $nomeFoto;
            }else{
                return redirect('/painel/pacientes')->with('alert2','Formato de Imagem Não Permitido!');
            }
        }
        
        $event->save();

        $select = $event->select('id','nome','nasc','cpf','wpp','foto','estado')->where('cpf',$cpf)->get();
        return response()->json($select);
    }
    public function editar(Request $r){
        $event = new Pacientes;

        $cpf = str_replace(".","",str_replace("-","",$r->cpf));
        $wpp = str_replace(")","",str_replace("(","",str_replace("-","",$r->wpp)));

        $id = $r->id;
        $event->nome = $r->nome;
        $event->cpf = $cpf;
        $event->wpp = $wpp;
        $event->nasc = $r->nasc;

        if($r->hasFile("foto") && $r->file("foto")->isValid()){
            $permitidas = ["jpg","jpeg","png"];
            $foto = $r->foto;
            $extensao = $foto->extension();
            if(in_array($extensao,$permitidas)){
                $nomeFoto = $cpf.".$extensao";
                $foto->move(public_path("img/pacientes"),$nomeFoto);
            }else{
                return redirect('/painel/pacientes')->with('alert2','Formato de Imagem Não Permitido!');
            }
        }else{$nomeFoto="none.jpg";}
        
        $event->where('id',$id)->update([
            "nome"=>$r->nome,
            "cpf"=>$cpf,
            "wpp"=>$wpp,
            "nasc"=>$r->nasc,
            "foto"=>$nomeFoto
        ]);

        //return response()->json(['Paciente Editado']);
        return redirect("/painel/pacientes")->with('alert5','Paciente Editado!');
    }

    public function atender($id){
        //echo $id;

        $event = Pacientes::findOrFail($id);
        return view('atender',["event" => $event]);
    }
    public function concluir(Request $r){
        //echo $id;
        $event = new Atendimentos;

        $event->sintomas = $r->sintomas;
        $event->lista = "$r->lista";
        $event->resultado = $r->resultado;
        $event->idPaciente = $r->idPaciente;

        $paci = new Pacientes;


        if($event->where('idPaciente', $event->idPaciente)->count() == 0) {
            $event->save();
        }else{
            $event->where('idPaciente',$event->idPaciente)->update($r->all());
        }
        $paci->where('id',$event->idPaciente)->update(['estado'=>$event->resultado]);

        return response()->json(['Paciente Atendido']);
        //return redirect("/painel/pacientes/atender/$event->idPaciente")->with('alert3','Paciente Atendido!');
    }

    public function remover($id){

        $event = new Pacientes;

        $event->where('id',$id)->firstorfail()->delete();

        //return response()->json(['Paciente Deletado']);
        return redirect('/painel/pacientes')->with('alert4','Paciente Removido!');
    }

}
