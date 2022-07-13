@extends('layout.app')
@section('title','Login')

@section('content')
    <header class="d-flex justify-content-center py-3 shadow">
        <ul class="nav nav-pills">
            <il class="nav-item"><a class="nav-link" href="/painel">Painel</a></il>
            <il class="nav-item"><a class="nav-link" href="/painel/pacientes">Pacientes</a></il>
            <il class="nav-item"><a class="nav-link active" href="/painel/atendimentos">Atendimentos</a></il>
        </ul>
    </header>
    <div class="container" style="display:flex;justify-content:space-around;align-items:center">
        <div>
            <h2>Marque os sintomas que o paciente apresenta</h2>
            <div id="sintomas">
            </div>
            <label for="" id="resultadoSintomas">Resultado: </label>
            <form id="atenderPaciente" action="/painel/pacientes/atender/{{$event->id}}" method="post" style="display:flex;flex-direction:column">
                @csrf
                <textarea style="display:none;" cols="40" rows="1" name="lista" id="areaSintomas"></textarea>
                <input type="number" style="display:none;" name="sintomas" id="sintNum">
                <input type="number" style="display:none;" name="resultado" id="resultNum">
                <input type="number" style="display:none;" name="idPaciente" value="{{$event->id}}">
                <input type="submit" class="btn btn-success" value="Atender">
            </form>
            <div id="boxResultado">
            </div>
        </div>

        <div class="card" style="width: 18rem;">
            <img src="/img/pacientes/{{ $event->foto }}" class="card-img-top">
            <ul class="list-group list-group-flush">
                @php 
                $resultados = [
                    "❗Possível Infectado",
                    "⚠️Potencial Infectado",
                    "✅Sintomas Insuficientes",
                    "Não Atendido"
                ];
                $corRR = ["red","orange","green","grey"];
                @endphp
                <li class="list-group-item">{{ $event->nome }}</li>
                <li class="list-group-item" style="color:{{$corRR[$event->estado]}}"><b>{{ $resultados[$event->estado] }}</b></li>
                <li class="list-group-item">{{""}}</li>
            </ul>
        </div>

    </div>
@endsection