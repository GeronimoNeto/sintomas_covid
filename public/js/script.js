$(document).ready(()=>{

    $("#atenderPaciente").submit((e)=>{
        e.preventDefault()
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var formData2 = new FormData(document.getElementById("atenderPaciente"))
        $.ajax({
            url: "atender",
            contentType: false,
            cache: false,
            processData: false,
            dataType: 'json',
            type: "POST",
            data: formData2,
            success:(msg)=>{
                br = $("#boxResultado")
                successa = $("<div/>",{
                    class: "alert alert-success alert-dismissible fade show",
                    role: "alert",
                    id: "meuAlertae",
                    text: "Paciente Atendido!",
                    style:"margin-top:10px"
                }).appendTo(br)
                $("<button/>",{
                    class:"btn-close",
                    data:"alert",
                    id:"btndoalerta"
                }).appendTo(successa)
                $("#meuAlertae button").click(()=>{successa.hide()})
            }
        })
        return false;
    })


    //editar registros
    function editarRegistros(){
        let qtd = document.querySelectorAll("#tabela tr").length
        editArea = $("#editArea")
        closeEditArea = $("#closeEditArea")
        for (let ed = 0; ed < qtd; ed++) {
            let editBtn = $("#edit"+ed)
            let sId = $("#edit"+ed+" button").attr("id")
            editBtn.click(()=>{
                editArea.attr("style","display:flex")
                $("#editarID").val($("#nome"+ed).attr("value"))
                $("#editarNome").val($("#nome"+ed).html())
                $("#editarIdade").val($("#idade"+ed).attr("value"))
                $("#editarCPF").val($("#cpf"+ed).html())
                $("#editarWPP").val($("#wpp"+ed).html())
                
                closeEditArea.click(()=>{
                    editArea.attr("style","display:none")
                })
            })
        }
    }

    //Salvar os dados num array
    tabela = document.getElementById("tabela")
    let qtd = document.querySelectorAll("#tabela tr").length
    array = []
    function criarDados(){
        let qtd = document.querySelectorAll("#tabela tr").length
        for(let i=0;i<qtd;i++){
            item = tabela.children[i].innerHTML
            array.push(item)
        }
    }
    criarDados()
    function salvarDados(){
        let qtd = document.querySelectorAll("#tabela tr").length
        item = tabela.children[qtd-1].innerHTML
        array.push(item)
    }
    //Pesquisar pessoas por meio dos dados inseridos no campo de pesquisa
    pesquisar = document.getElementById("pesquisar")
    $(pesquisar).keyup(()=>{
        tabela.innerHTML=""
        pValue = $(pesquisar).val()
        if(pValue!=""){
            array.forEach(element => {
                if(element.includes(pValue)){
                    tabela.innerHTML+=element
                }
            });
        }else{
            array.forEach(element => {
                tabela.innerHTML+=element
            });
        }
        editarRegistros()
    });

    //Data maxima no input date
    if(document.getElementById("inputDate")){
        inputDate = document.getElementById("inputDate")
        inputDate.min="1900-01-01"
        const date = new Date();
        if((date.getMonth()+1)>10){
            mes = date.getMonth()+1
        }else{
            mes = "0"+(date.getMonth()+1)
        }
        inputDate.max=(date.getFullYear()-1)+"-"+mes+"-"+date.getDate();
    }
    //Formatar o CPF no Input
    $("#inputCPF").keydown((k)=>{
        key = window.event.keyCode
        if(key==8){document.querySelector("#inputCPF").value=""}
        $("#inputCPF").attr("maxlength", "14")
        icval = $("#inputCPF").val()
        var v = icval
        if(v.length == 3 || v.length == 7){
            document.querySelector("#inputCPF").value += "."
        }else if(v.length == 11){
            document.querySelector("#inputCPF").value += "-"
        }
    })
    //Formatar o WPP no Input
    $("#inputWPP").keydown((k)=>{
        key = window.event.keyCode
        if(key==8){document.querySelector("#inputWPP").value=""}
        $("#inputWPP").attr("maxlength", "14")
        icval = $("#inputWPP").val()
        var v = icval
        if(v.length == 0){
            document.querySelector("#inputWPP").value += "("
        }else if(v.length == 3){
            document.querySelector("#inputWPP").value += ")"
        }
        else if(v.length == 9){
            document.querySelector("#inputWPP").value += "-"
        }
    })

    //Formatar o CPF no Editar
    $("#editarCPF").keydown((k)=>{
        key = window.event.keyCode
        if(key==8){document.querySelector("#editarCPF").value=""}
        $("#editarCPF").attr("maxlength", "14")
        icval = $("#editarCPF").val()
        var v = icval
        if(v.length == 3 || v.length == 7){
            document.querySelector("#editarCPF").value += "."
        }else if(v.length == 11){
            document.querySelector("#editarCPF").value += "-"
        }
    })
    //Formatar o WPP no Editar
    $("#editarWPP").keydown((k)=>{
        key = window.event.keyCode
        if(key==8){document.querySelector("#editarWPP").value=""}
        $("#editarWPP").attr("maxlength", "14")
        icval = $("#editarWPP").val()
        var v = icval
        if(v.length == 0){
            document.querySelector("#editarWPP").value += "("
        }else if(v.length == 3){
            document.querySelector("#editarWPP").value += ")"
        }
        else if(v.length == 9){
            document.querySelector("#editarWPP").value += "-"
        }
    })

    //Alertas
    setTimeout(()=>{ //Fecha automaticamente após 5 segundos
        $("#meuAlerta").hide();
    },5000)
    $("#meuAlerta button").click(()=>{ //Cliar no botão para fechar
        $("#meuAlerta").hide();
    })


    //Imprimir os checkbox com os sintomas
    listaSintomas = [
        "Febre",
        "Coriza",
        "Nariz entupido",
        "Cansaço",
        "Tosse",
        "Dor de cabeça",
        "Dores no corpo",
        "Mal estar geral",
        "Dor de garganta",
        "Dificuldade de respirar",
        "Falta de paladar",
        "Falta de olfato",
        "Dificuldade de locomoção",
        "Diarréia"
    ]
    resultados = [
        "<b style='color:red'>❗POSSÍVEL INFECTADO</b>",
        "<b style='color:orange'>⚠️POTENCIAL INFECTADO</b>",
        "<b style='color:green'>✅SINTOMAS INSUFICIENTES</b>",
        "<b style='color:grey'>Não Atendido</b>"
    ]
    let somaSintomas = 0
    sintomasPaciente = []
    divSintomas = $("#sintomas")
    listaSintomas.forEach(element => {
        let formCheck = $('<div/>',{
            class: 'form-check'
        }).appendTo(divSintomas);
        let formCheckInput = $('<input/>',{
            class: 'form-check-input',
            type: 'checkbox',
            value: 1
        }).appendTo(formCheck)
        let formCheckLabel = $('<label/>',{
            class: 'form-check-label',
            text: element
        }).appendTo(formCheck)

        formCheckInput.click(()=>{
            if(formCheckInput.prop("checked")){
                somaSintomas+=1
                sintomasPaciente.push(element)
            }else{
                somaSintomas-=1
                sintomasPaciente.splice(sintomasPaciente.indexOf(element),1)
            }
            if(somaSintomas>=9){
                rr = 0
            }else if(somaSintomas>=6 && somaSintomas<9){
                rr = 1
            }else if(somaSintomas<6){
                rr = 2
            }
            resultadoFinal = resultados[rr]
            $("#resultadoSintomas").html("Resultado: "+resultadoFinal)
            $("#areaSintomas").html(sintomasPaciente+",")
            $("#sintNum").val(somaSintomas)
            $("#resultNum").val(rr)
        })
    });

    editarRegistros()

    $("#salvarPaciente").submit((e)=>{
        e.preventDefault()
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var formData = new FormData(document.getElementById("salvarPaciente"))
        $.ajax({
            url: "pacientes",
            contentType: false,
            cache: false,
            processData: false,
            dataType: 'json',
            type: "POST",
            data: formData,
            success: (select)=>{
                newAno = (select[0].nasc)
                newIdade = 2022-newAno.substring(4,0)

                let novo = `<tr>
                    <th><a href="/img/pacientes/${select[0].foto}"><img style="background-image:url(/img/pacientes/${select[0].foto})" class="imagemPaciente"></a></th>
                    <th id="nome${qtd}" value="${select[0].id}">${select[0].nome}</th>
                    <th id="idade${qtd}" value="${select[0].nac}">${newIdade}</th>
                    <th id="cpf${qtd}">${$("#inputCPF").val()}</th>
                    <th id="wpp${qtd}">${$("#inputWPP").val()}</th>
                    <th style="text-align:center;">${resultados[select[0].estado]}</th>
                    <th>
                        <a href="/painel/pacientes/atender/${select[0].id}"><button type="submit" class="btn btn-success w-100" name="atender">Atender</button></a>
                        <a id="edit${qtd}"><button id="${select[0].id}" type="submit" class="btn btn-warning w-100" name="atender">Editar</button></a>
                        <a href="/painel/pacientes/remover/${select[0].id}"><button type="submit" class="btn btn-danger w-100" name="atender">Remover</button></a>
                    </th>
                </tr>`
                $("#tabela").append(novo)
                $('#salvarPaciente input').val("")
                $('#salvarPaciente input[type = submit]').val("Enviar")
                salvarDados()
                editarRegistros()
            }
        })

        return false;
    })
});
