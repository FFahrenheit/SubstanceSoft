var formulario = document.getElementById('formulario');
var formulario2 = document.getElementById('formulario2');

formulario2.addEventListener('submit', function (e) {
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario2);

    if (formulario2.checkValidity() === true) {
        fetch('../../php/requests/login.php',
            {
                method: 'POST',
                body: datos
            })
            .then(res => {
                console.log("respuesta: "+res);
                try
                {
                    res = res.json();
                }
                catch(e)
                {
                    console.log("Parser error");
                    res = ' ';
                    return res;
                }
                return res;
            })
            .then(data => {
                console.log("aqui llega js");
                switch (data) {
                    case 'horario':
                        alert("Por el momento no pueden ingresar empleados");
                        window.location.reload(true);
                        break;
                    case 'unable':
                        alert("El acceso por código está deshabilitado");
                        window.location.reload(true);
                        break;
                    case 'user':
                    case 'password':
                        alert("Nombre de usuario o contraseña incorrectas");
                        formulario2.reset();
                        break;
                    case 'connection':
                        alert("Error en el servidor");
                        window.location.pathname = '/substancesoft/views/menus/login.html';
                        break;
                    case 'success':
                        window.location.pathname = '/substancesoft/views/menus/index.php';
                        break;
                    default:
                        alert('Error en el sistema');
                }
            })
    }
});

formulario.addEventListener('submit',  (e) =>
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario);

    if (formulario.checkValidity() === true)
    {
        fetch('../../php/requests/login.php',
            {
                method: 'POST',
                body: datos
            })
            .then(res =>
                {
                    console.log("Respuesta: "+res);
                    try
                    {
                        res = res.json();
                    }
                    catch(e)
                    {
                        console.log("Parser error");
                        res = ' ';
                        return res;
                    }
                    return res;
                })
                .then(data => {
                console.log(data);
                switch (data) {
                    case 'new':
                        alert("Debe elegir una nueva contraseña");
                        window.location.pathname = '/substancesoft/views/functions/forms/cambiar-pass.php';
                        break;
                    case 'horario':
                        alert("Por el momento no pueden ingresar empleados");
                        formulario.reset();
                        break;
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
                        window.location.pathname = '/substancesoft/views/menus/index.php';
                        break;
                    default:
                        alert("Error en el sistema");
                }
            })
    }
})
