var user;

function showDetails(button)
{
    user = button.id;
    console.log(user);
}

function confirmDelete()
{
    var datos = new FormData();
    var code = document.getElementById('codigo').value;
    
    datos.append("user",user);
    datos.append("code", code);
 
    console.log(user+" "+code);
    fetch('../../php/forms/asignar-tarjeta.php', 
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