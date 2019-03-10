$(buscarPlatillo());

function buscarPlatillo(consulta)
{
    $.ajax({
        url:'/substancesoft/php/requests/platillo.php',
        type: 'POST',
        datatype: 'html',
        data: {consulta:consulta}
    })
    .done(function(respuesta)
    {
        $("#busqueda").html(respuesta);
    }) 
    .fail(function()
    {
        console.log("error");
    })
}

$(document).on('keyup','#search',function(){
    var valor = $(this).val();
    console.log(valor);
    if(valor != "")
    {
        buscarPlatillo(valor);
    }
    else{
        buscarPlatillo();
    }
})

var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../../php/forms/functions/agregar-comanda.php', 
        {
            method: 'POST',
            body: datos
        })
        .then (res => res.json())
        .then (data =>
            {
                console.log("aqui llega js");
                console.log(data);
                
                alert(data);

                window.location.reload(false); 
            })
    }
})
