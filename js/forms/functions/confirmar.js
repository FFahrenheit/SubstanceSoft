var formulario = document.getElementById('password');
var pass = document.getElementById('pass');
var reference = document.getElementById('ref').value;

formulario.addEventListener('submit',(e)=>
{
    validate(e);
});

function validate(e) {
    e.preventDefault();
    console.log(pass.value);
    var datos = new FormData();
    datos.append("pass", pass.value);
    fetch('../../../php/requests/confirmar-pass.php',
        {
            method: 'POST',
            body: datos
        })
        .then(res => {
            try
            {
                return res.json();
            }
            catch (ex) {
                console.log("Error de respuesta")
                alert('Error en la respuesta');
            }
        })
        .then(data => {
            console.log(data);
            switch(data)
            {
                case 'ok':
                    switch(reference)
                    {
                        case 'pass':

                            window.location.pathname = '/SubstanceSoft/views/functions/forms/passwords.php'
                            break;
                        case 'export':
                            window.location.pathname = '/SubstanceSoft/views/functions/forms/export.php'
                            break;
                        case 'import':
                            window.location.pathname = '/SubstanceSoft/views/functions/forms/import.php'
                            break;
                        default:
                            console.log("no soportado aún");
                            break;
                    }
                    break;
                case 'no':
                    alert("Contraseña inválida");
                    break;
                default:
                    alert("Error desconocido");
                    break;
            }
            formulario.reset();
        })
        .catch((e)=>
        {
            console.log(e);
            alert("Error en el servidor");
            formulario.reset();
        })
}
