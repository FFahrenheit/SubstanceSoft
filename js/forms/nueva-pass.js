var formulario = document.getElementById('formulario');
var pass1 = document.getElementById('password');
var pass2 = document.getElementById('confirm_password');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();

    console.log("Inicio");

    var datos = new FormData(formulario);

    if(pass1.value != pass2.value)
    {
        alert("Las contraseñas no coinciden");
        return;
    }
    if(pass1.value.length<4)
    {
        alert("Contrseña demasiado corta");
        return;
    }

    if(formulario.checkValidity()===true)
    { 
        fetch('../../../php/forms/modificar-pass.php',
        {
            method: 'POST', 
            body: datos
        })
        .then (res => res.json())
        .then (data => 
            {
                console.log("aqui llega js");
                console.log(data);

                if(data=='Exito')
                {
                    alert('Modificado correctamente');
                    window.location.pathname = '/SubstanceSoft/views/menus/index.php'
                }
                else 
                {
                    alert("Error");
                    alert(data);
                    formulario.reset();
                }

                //window.location.pathname = '/substancesoft/views/forms/modificar-usuario.php';

            })
    }
})