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
    fetch('../../php/forms/generar-codigo.php', 
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
        window.location.reload();

    })
    
}

function setCodeStatus(new_status)
{
    console.log(new_status);

    var datos = new FormData();
    datos.append("new",new_status);
    datos.append("preferencia",'acceso_codigo')
    fetch('../../php/forms/cambiar-preferencia.php', 
    {
        method: 'POST',
        body: datos
    })
    .then (res => res.json())
    .then (data =>
    {
        console.log("aqui llega js");
        console.log(data);
        //alert(data);
        window.location.reload();
    })
}