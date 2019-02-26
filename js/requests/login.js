var formulario = document.getElementById('formulario');

formulario.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if(formulario.checkValidity()===true)
    {
        fetch('../../php/requests/login.php',
        {
            method: 'POST', 
            body: datos
        })
        .then (res => res.json())
        .then (data => 
            {
                console.log("aqui llega js");
                console.log(data);

                switch(data)
                {
                    case 'user':
                    case 'password':
                        alert("Nombre de usuario o contraseña incorrectas");
                        formulario.reset();
                        break;
                    case 'connection':
                        alert("Error en el servidor");
                        window.location.pathname = '/substancesoft/views/menus/login.html';
                        break;
                    case 'success':
                    window.location.pathname = '/substancesoft/views/menus/plantilla.html';
                    break;
                }
            })
    }
})