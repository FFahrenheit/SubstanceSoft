var clave;

function showDetails(button)
{
    clave = button.id;
    console.log(clave);
}

function confirmDelete()
{
    var datos = new FormData();

    datos.append("numero", clave);

    console.log(clave);
    fetch('../../php/forms/eliminar-mesa.php',
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
        //window.location.pathname = '/substancesoft/views/forms/modificar-usuario.php';
        //window.history.back();
        window.location.reload(true);

    })

}
