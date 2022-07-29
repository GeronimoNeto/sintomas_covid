@php
function formatCPF($value){
    $cpf = preg_replace("/\D/", '', $value); 
    if (strlen($cpf) === 11) {
        return preg_replace("/(\d{3})(\d{3})(\d{3})(\d{2})/", "\$1.\$2.\$3-\$4", $cpf);
    }
    return preg_replace("/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/", "\$1.\$2.\$3/\$4-\$5", $cpf);
}
@endphp
@foreach($pacientes as $k=>$paciente)
<tr>
    <th><a href="/img/pacientes/{{$paciente->foto}}"><img style="background-image:url(/img/pacientes/{{$paciente->foto}})" class="imagemPaciente"></a></th>
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
        
        $resultados = [
            "❗Possível Infectado",
            "⚠️Potencial Infectado",
            "✅Sintomas Insuficientes",
            "Não Atendido"
        ];
        $corRR = ["red","orange","green","grey"];

    @endphp
    <th id="nome{{$k}}" value="{{$paciente->id}}">{{$paciente->nome}}</th>
    <th id="idade{{$k}}" value="{{$paciente->nasc}}">{{$idade}}</th>
    <th id="cpf{{$k}}">{{formatCPF($paciente->cpf)}}</th>
    <th id="wpp{{$k}}">{{$wpp}}</th>
    <th style="text-align:center;color:{{$corRR[$paciente->estado]}}">{{$resultados[$paciente->estado]}}</th>
    <th>
        <a href="/painel/pacientes/atender/{{$paciente->id}}"><button type="submit" class="btn btn-success w-100" name="atender">Atender</button></a>
        <a id="edit{{$k}}"><button id="{{$paciente->id}}" type="submit" class="btn btn-warning w-100" name="atender">Editar</button></a>
        <a href="/painel/pacientes/remover/{{$paciente->id}}"><button type="submit" class="btn btn-danger w-100" name="atender">Remover</button></a>
    </th>
</tr>
@endforeach