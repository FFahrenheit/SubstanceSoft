var drive = document.getElementById('drive');
var clave = document.getElementById('clave');

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
var formulario2 = document.getElementById('formulario2');

formulario.addEventListener('submit',function(e)
{
    var clave = document.getElementById('clave').value;
    var qty = document.getElementById('qty').value;
    var platillo = document.getElementById('platillo').value;
    e.preventDefault();
    console.log('working!');

    var datos = new FormData();
    datos.append("clave",clave);
    datos.append("qty",qty);
    datos.append("platillo",platillo);

    console.log(clave+qty+platillo);

 
    if(formulario.checkValidity() &&
    formulario2.checkValidity() && clave!='' && qty!='' && platillo!='')
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
    else 
    {
        alert('Rellene todos los campos');
        console.log("Rellene todos los campos");
        return;
    }
})

function updateText(label)
{
    //label = '<p class="comm" style="color: #000;">Hola</p>';
    console.log(label.id);
    $.ajax({
        url:'/substancesoft/php/requests/detalles-platillo.php',
        type: 'POST',
        datatype: 'html',
        data: {nombre:label.id}
    })
    .done(function(respuesta)
    {
        $("#actual").html(respuesta);
        var platillo = '<input name="platillo" id="platillo" hidden value="'+label.id+'"></input>'; 
        $("#plato").html(platillo);
    })
    .fail(function()
    {
        console.log("error");
    });

    //console.log(label.id);
}

function goBackDrive()
{
    if(drive.value == 1)
    {
        var path = '/substancesoft/views/functions/forms/ticket.php?clave='+clave.value+'&drive=1';
        window.location.href = path;
    }
    else 
    {
        window.history.back();
    }
}