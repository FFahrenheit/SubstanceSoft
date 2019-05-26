var user;
var cocina;
var solicitante;

var timer = setInterval(() => {
    window.location.reload(true);
}, 
5000);

function response(status, key)
{
    console.log(status + " " + key);
    $.ajax(
        {
          url: '/substancesoft/php/requests/respuesta-ayuda.php',
          type: 'POST',
          datatype: 'html',
          data: {status:status,
        key:key}
        }
      )
      .done((resp)=>
      {
        console.log(resp);
        alert(resp);
        window.location.reload(true);
      })
      .fail((e)=>
      {
        console.log("Error: "+e);
        window.location.reload(true);
      })
}

function askForHelp(trigger)
{
    cocina = trigger.value;

    $("#ayuda").modal('show');
    clearInterval(timer);

    $.ajax(
        {
          url: '/substancesoft/php/requests/ayuda.php',
          type: 'POST',
          datatype: 'html',
          data: {cocina:cocina}
        }
      )
      .done((resp)=>
      {
        console.log(resp);
          $("#cocinas").empty();
          $("#cocinas").html(resp);
          console.log("Hecho");
      })
      .fail((e)=>
      {
        console.log("Error: "+e);
      })
}

function help(sol)
{
    solicitante = sol.value;

    $.ajax(
        {
            url: '/substancesoft/php/requests/pedir-ayuda.php',
            type: 'POST',
            datatype: 'html',
            data: {cocina:cocina,
            solicitante, solicitante}
        }
    )
    .done((resp)=>
    {
        alert(resp);
        console.log(resp);
        window.location.reload(true);
    })
    .fail((e)=>
    {
        alert('Ocurrió un error');
      console.log("Error: "+e);
      window.location.reload(true);
    })
}

function showDetails(button)
{
    user = button.id;
    console.log(user);
    window.stop();
}

function cont()
{
    window.location.reload(true); 
}

function confirmDelete()
{
    var datos = new FormData();
    clearInterval(timer);

    datos.append("user",user);

    console.log(user);
    fetch('../../../php/forms/functions/notificar-comanda.php', 
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
        window.location.reload(true); 

    })
}