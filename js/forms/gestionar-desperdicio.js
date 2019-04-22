function setCodeStatus(new_status)
{
    console.log(new_status);

    var datos = new FormData();
    datos.append("new",new_status);
    datos.append("preferencia",'desperdicio_diario');
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
        alert(data);
        window.location.reload();
    })
}