var user;

function showDetails(button)
{
    user = button.id;
    console.log(user);
}

function confirmDelete()
{
    var datos = new FormData();

    datos.append("user",user);

    console.log(user);
    fetch('../../php/forms/eliminar-usuario.php', 
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
        window.history.back();

    })
    
}