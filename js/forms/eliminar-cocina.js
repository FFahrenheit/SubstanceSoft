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
        window.location.pathname = '/substancesoft/views/forms/modificar-cocina.php';
    })
}
