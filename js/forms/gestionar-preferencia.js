function setCodeStatus(new_status,preference)
{
    console.log(new_status);

    console.log(preference);

    var datos = new FormData();
    datos.append("new",new_status);
    datos.append("preferencia",preference);
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