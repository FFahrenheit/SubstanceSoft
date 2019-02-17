var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();

    console.log("Inicio");

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/forms/modificar-usuario.php',
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
                
                window.location.pathname = '/substancesoft/views/forms/modificar-usuario.php';

            })
    }
})