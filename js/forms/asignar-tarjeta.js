var user;
var counter=0;
var register;

function showDetails(button)
{
    user = button.id;
    console.log(user);
}

function asign(code)
{
    var datos = new FormData();
    
    datos.append("user",user);
    datos.append("code", code);
 
    console.log(user+" ");
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
        if(data!='Exito')
        {
            alert("Ha ocurrido un problema al empezar la transacción");
            window.location.reload(true);
        }
        //alert(data);
        //window.location.pathname = '/substancesoft/views/forms/modificar-usuario.php';
        //window.location.reload(true);
    })
}

function confirmDelete()
{
    $('#registrar').modal('show');
    asign(0);  //Poner a 0, tarjeta fantasma

    register = setInterval( ()=>
        {
            var datos = new FormData();

            datos.append("user",user);
            console.log(user);

            fetch('../../php/forms/esperar-tarjeta.php',
            {
                method: 'POST',
                body: datos
            })
            .then(res => 
                {
                    try
                    {
                        return res.json();
                    }
                    catch(e)
                    {
                        $("#status").html('<p><font color="red">Ha ocurrido un error</font></p>');
                    }
                })
            .then(data => 
                {
                    console.log("Esperando");
                    switch(data)
                    {
                        case 'ok':
                            clearInterval(register);
                            $("#status").html('<p><font color="green">Ok</font></p>');
                            alert("Proceso completado con éxito");
                            window.location.reload(true);
                            break;
                        case "no":
                            var text;
                            if(counter%4==0)
                            {
                                text = "Esperando..."
                                counter = 0;
                            }
                            else if(counter%3==0)
                            {
                                text = "Esperando..";
                            }
                            else if(counter%2==0)
                            {
                                text = "Esperando.";
                            }
                            else
                            {
                                text = "Esperando";
                            }
                            $("#status").html('<p>'+text+'</p>');
                            counter++;
                            break;
                        default:
                            $("#status").html('<p><font color="red">'+data+'</font></p>');
                            break;
                    }
                })
            .catch((e)=>
            {
                $("#status").html('<p><font color="red">Ha ocurrido un error</font></p>');
            });

        },1000);
}

function closeAll()
{
    $("#delete").modal('hide');
    $("#registrar").modal('hide');
    asign('NULL');
    clearInterval(register);
}