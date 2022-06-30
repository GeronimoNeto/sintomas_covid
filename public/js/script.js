$(document).ready(()=>{
    /*
    $("#login").submit(()=>{
        var info = jQuery( this ).serialize()
        $.ajax({
            url: '/',
            cache: false,
            data: info,
            type: "GET",
            success:(msg)=>{
                console.log("envio de formulario"+msg)
            }
        })
        return false;
    })
    */

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
    inputDate = document.getElementById("inputDate")
    inputDate.min="1900-01-01"
    const date = new Date();
    if((date.getMonth()+1)>10){
        mes = date.getMonth()+1
    }else{
        mes = "0"+(date.getMonth()+1)
    }
    inputDate.max=date.getFullYear()+"-"+mes+"-"+date.getDate();

    //Formatar o CPF no Input
    $("#inputCPF").keydown(()=>{
        $("#inputCPF").attr("maxlength", "14")
        icval = $("#inputCPF").val()
        var v = icval
        if(v.length == 3 || v.length == 7){
            document.querySelector("#inputCPF").value += "."
        }else if(v.length == 11){
            document.querySelector("#inputCPF").value += "-"
        }
    })

});
