@extends('layout.app')
@section('title','Login')

@section('content')
    <header class="d-flex justify-content-center py-3 shadow">
        <ul class="nav nav-pills">
            <il class="nav-item"><a class="nav-link" href="/painel">Painel</a></il>
            <il class="nav-item"><a class="nav-link active">Pacientes</a></il>
            <il class="nav-item"><a class="nav-link" href="/painel/atendimentos">Atendimentos</a></il>
        </ul>
    </header>
    <div class="pacientes"><br>
        <div class="col-3">
            <h2>Registrar Paciente</h2>
            <form action="" method="get">
                <div>
                    <input type="text" placeholder="Nome Completo" class="form-control">
                    
                        <i style="margin-left:3px;">CPF</i>
                        <input type="text" placeholder="000.000.000-00" class="form-control" id="inputCPF">
                    
                    <div>
                        <i style="margin-left:3px;">Contato</i>
                        <input type="text" placeholder="(00)90000-0000" class="form-control">
                    </div>
                    <input type="date" class="form-control" id="inputDate">
                </div>
                <input type="submit" class="btn btn-primary">
            </form>
        </div>
        <div class="col">
            <input type="text" class="form-control" placeholder="Pesquisar pacientes" aria-label="Username" id="pesquisar">
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th></th>
                        <th>Nome</th>
                        <th>Idade</th>
                        <th>CPF</th>
                        <th>Contato</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="tabela">
                    @php
                    function formatCPF($value){
                        $cpf = preg_replace("/\D/", '', $value); 
                        if (strlen($cpf) === 11) {
                            return preg_replace("/(\d{3})(\d{3})(\d{3})(\d{2})/", "\$1.\$2.\$3-\$4", $cpf);
                        }
                        return preg_replace("/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/", "\$1.\$2.\$3/\$4-\$5", $cpf);
                    }
                    @endphp
                    @foreach($pacientes as $paciente)
                    <tr>
                        <th><img src="/img/{{$paciente->foto}}" width="70"></th>
                        @php
                            $ano = intval(substr($paciente->nasc,0,4));
                            $mes = intval(substr($paciente->nasc,5,2));
                            $dia = intval(substr($paciente->nasc,8));

                            $anoAtual = date('Y');
                            $mesAtual = date('m');
                            $diaAtual = date('d');

                            $idade = $anoAtual-$ano;

                            if($mesAtual<$mes){
                                $idade -= 1;
                            }elseif(($mesAtual == $mes) && ($diaAtual <= $dia)){
                                $idade -= 1;
                            }

                            $num = $paciente->wpp;
                            $wpp = '('.substr($num,0,2).')'.substr($num,2,5).'-'.substr($num,7); 
                        @endphp
                        <th>{{$paciente->nome}}</th>
                        <th>{{$idade}}</th>
                        <th>{{formatCPF($paciente->cpf)}}</th>
                        <th>{{$wpp}}</th>
                        <th>
                            <button class="btn btn-success w-100">Atender</button>
                            <button class="btn btn-warning w-100">Editar</button>
                            <button class="btn btn-danger w-100">Remover</button>
                        </th>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            </div>
    </div>
@endsection