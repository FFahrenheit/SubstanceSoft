var platillo;
var destino;

function showDetails(button,cocina)
{
    var nombre = cocina;
    console.log(nombre);
    platillo = button.id;
    console.log(platillo);
    
    $.ajax({
        url:'/substancesoft/php/requests/cocinas-opciones.php',
        type: 'POST',
        datatype: 'html',
        data: {nombre:nombre}
    })
    .done(function(respuesta)
    {
        $("#cocina").html(respuesta);
    })
    .fail(function()
    {
        console.log("error");
    });
}

function confirmMigrate()
{
    var currentKitchen = document.getElementById('cocina');
    var destino = currentKitchen.options[currentKitchen.selectedIndex].value;

    console.log(destino);

    $.ajax({
        url:'/substancesoft/php/requests/migrar-platillo.php',
        type: 'POST',
        datatype: 'html',
        data: {
            origen:platillo,
            destino:destino    
        }
    })
    .done(function(respuesta)
    {
        alert("Platillo migrado");
        window.location.reload(true);
    })
    .fail(function()
    {
        console.log("error");
    });
}