var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/agregar-receta.php', 
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

                //window.location.pathname = '/substancesoft/views/forms/nueva-receta.php';
                window.history.reload(true);
            })
    }
})

var user;

function showDetails(button)
{
    user = button.id;
    console.log(user);
}

function confirmDelete()
{
    var datos = new FormData();
    
    datos.append("clave",user);
 
    console.log(user);
    fetch('../../php/forms/eliminar-receta.php', 
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