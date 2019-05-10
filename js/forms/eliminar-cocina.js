var nombre;

function showDetails(button)
{
    nombre = button.id;
    console.log(nombre);
}

function confirmDelete()
{
    var datos = new FormData();

    datos.append("nombre",nombre);

    console.log(nombre);
    fetch('../../php/forms/eliminar-cocina.php',
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
        //window.location.pathname = '/substancesoft/views/forms/modificar-cocina.php';
        window.location.reload(true);

    })
}

function confirmMigrate()
{
    $("#update").modal();

    $.ajax({
        url:'/substancesoft/php/requests/cocinas-opciones.php',
        type: 'POST',
        datatype: 'html',
        data: {nombre:nombre}
    })
    .done(function(respuesta)
    {
        $("#migrar").html(respuesta);
    })
    .fail(function()
    {
        console.log("error");
    });
}

function confirmMigrateAll()
{
    var currentKitchen = document.getElementById('migrar');
    var kitchen = currentKitchen.options[currentKitchen.selectedIndex].value;


    $.ajax({
        url:'/substancesoft/php/requests/migrar-cocina.php',
        type: 'POST',
        datatype: 'html',
        data: {
            origen:nombre,
            destino:kitchen    
        }
    })
    .done(function(respuesta)
    {
        alert("Se han migrado todos los platillos");
        window.location.reload(true);
    })
    .fail(function()
    {
        console.log("error");
    });

}

function confirmMigrateManually()
{
    var path  = '/substancesoft/views/functions/forms/migrar-platillos.php?cocina='+nombre;
    window.location.href = path;
}

function cancelAll()
{
    $('#delete').modal('hide');
    $('#update').modal('hide');
}