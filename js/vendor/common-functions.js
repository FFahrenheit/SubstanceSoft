$("#menu-toggle").click(function (e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

function goBack() {
  window.history.back();
}

function refreshPage() {
  window.location.reload(true);
}

function checkNotify()
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

var constantNotification = setInterval(checkNotify,3000);