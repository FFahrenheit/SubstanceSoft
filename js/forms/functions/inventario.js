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
    else 
    {
        console.log(btn.id);
        console.log(qty);
    }
}