var clave;

function showDetails(button)
{
    clave = button.id;
    console.log(clave);
}

function confirmDelete()
{
    var datos = new FormData();

    datos.append("clave", clave);

    console.log(clave);
    fetch('../../php/forms/eliminar-platillo.php',
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
        windows.location.reload();

    })

}
