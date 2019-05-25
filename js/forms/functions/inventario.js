$(buscarIngrediente());

function buscarIngrediente(consulta)
{
    console.log(consulta);
    $.ajax({
        url:'/substancesoft/php/requests/inventario.php',
        type: 'POST',
        datatype: 'html',
        data: {consulta:consulta}
    })
    .done(function(respuesta)
    {
        $("#tabla").html(respuesta);
    })    
    .fail(function()
    {
        console.log("error");
    })
}

$(document).on('keyup','#search',function()
{
    var valor = $(this).val();
    console.log(valor);
    if(valor != "")
    {
        buscarIngrediente(valor);
    }
    else{
        buscarIngrediente();
    }
})

function addInventory(btn)
{
    var id = 'button'.concat(btn.id);
    var qty = document.getElementById(id).value;
    if(qty=='')
    {
        alert('Por favor, ingrese la cantidad a agregar');
    }
    else if(qty<0)
    {
        alert('Ingrese una cantidad válida');
    }
    else 
    {
        var datos = new FormData();
        datos.append("id",btn.id);
        datos.append("qty",qty);
        fetch('../../php/forms/functions/agregar-inventario.php', 
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

                window.location.reload(true); 
            })
    }
}