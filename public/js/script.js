$(document).ready(()=>{
    /*
    $("#salvarPaciente").submit(()=>{
        var info = jQuery( this ).serialize()
        $.ajax({
            url: '',
            cache: false,
            data: info,
            type: "GET",
            success:(msg)=>{
                console.log("envio de formulario"+msg)
            }
        })
        return false;
    })*/
    

    //Salvar os dados num array
    tabela = document.getElementById("tabela")
    qtd = document.querySelectorAll("#tabela tr").length
    array = []
    for(let i=0;i<qtd;i++){
        item = tabela.children[i].innerHTML
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
        "<b style='color:red'>POSSÍVEL INFECTADO</b>",
        "<b style='color:orange'>POTENCIAL INFECTADO</b>",
        "<b style='color:green'>SINTOMAS INSUFICIENTES</b>"
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

});
