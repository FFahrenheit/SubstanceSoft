$("#menu-toggle").click(function (e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

function goBack() {
  window.history.back();
}

function goBack(n=1)
{
  window.history.go(-1*n);
}

function refreshPage() {
  window.location.reload(true);
}

function updateChat()
{
  console.log("Actualizando chat");
  $.ajax(
    {
      url: '/substancesoft/php/requests/chat.php',
      type: 'POST',
      datatype: 'html'
    }
  )
  .done((resp)=>
  {
    console.log(resp);
    if(resp!="void")
    {
      $("#chat").empty();
      $("#chat").html(resp);
      console.log("Hecho");
    }
    else
    {
      console.log("No hay nuevos mensajes");
    }
  })
  .fail((e)=>
  {
    console.log("Error: "+e);
  })
}

var constantNotification = setInterval(updateChat,1000);

/*function checkNotify()
{
    console.log('Cargado');
    $.ajax({
      url: '/substancesoft/php/requests/notificaciones.php',
      type: 'POST',
      datatype: 'html'
    })
      .done(function (respuesta) {
        try {
          ans = JSON.parse(respuesta);
        } catch (e) {
          return false;
        }
        var notificacion;
        for (var i = 0; i < ans.length; i++) {
          alert(ans)
          console.log(i);
          var notificacion = new Notification('Notificación (' + (ans.length - 1 - i) + ' más)', {
            'body': ans[i].texto,
            'icon': '../../images/icono.png',
            'renotify': true,
            'tag': i,
            'timestamp': ans[i].hora,
            'requireInteraction': true
          });
          notificacion.onclick = function (event) {
            this.close();
          };
        }
        return true;
      })
      .fail(function () {
        console.log("Error en carga");
      })
  }

document.addEventListener("DOMContentLoaded",checkNotify);

var constantNotification = setInterval(checkNotify,3000);*/
