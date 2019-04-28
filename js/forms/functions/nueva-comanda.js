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

function buscarCategoria(category)
{
    console.log(category);
    $.ajax({
        url:'/substancesoft/php/requests/platillo.php',
        type: 'POST',
        datatype: 'html',
        data: {categoria:category}
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
                console.log(data);
                switch(data)
                {
                    case 'exito':
                        alert('Comanda(s) agregada(s)');
                        break;
                    case 'conexion':
                        alert('Error en la conexion');
                        break;
                    case 'query':
                        alert('No se pudo agregar la comanda');
                        break;
                    case 'query2':
                        alert('No se actualizó el total pero si se pidió comanda');
                        break;
                    default:
                        alert(data);
                        break;
                }
                console.log("aqui llega js");
                
                //alert(data);

                window.location.reload(false); 
            })
    }
})

function updateText(label)
{
    //label = '<p class="comm" style="color: #000;">Hola</p>';
    $.ajax({
        url:'/substancesoft/php/requests/detalles-platillo.php',
        type: 'POST',
        datatype: 'html',
        data: {nombre:label.id}
    })
    .done(function(respuesta)
    {
        console.log(respuesta);
        $("#actual").html(respuesta);   
    })
    .fail(function()
    {
        console.log("error");
    })

    //console.log(label.id);
}