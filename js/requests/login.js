var formulario = document.getElementById('formulario');
var formulario2 = document.getElementById('formulario2');

formulario2.addEventListener('submit',function(e)
{
    e.preventDefault();
    console.log('working!');

    var datos = new FormData(formulario2);

    if(formulario2.checkValidity()===true)
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
                    case 'unable':
                        alert("El acceso por código está deshabilitado");
                        formulario2.reset();
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
                }
            })
    }
})

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
                        window.location.pathname = '/substancesoft/views/menus/index.php';
                    break;
                }
            })
    }
})