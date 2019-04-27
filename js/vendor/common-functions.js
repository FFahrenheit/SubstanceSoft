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

document.addEventListener("DOMContentLoaded", function () {
  console.log('Cargado');
  $.ajax({
    url: '/substancesoft/php/requests/notificaciones.php',
    type: 'POST',
    datatype: 'html'
  })
    .done(function (respuesta) {
      ans = JSON.parse(respuesta);
      var notificacion;
      for(var i = 0; i < ans.length; i++)
      {
        console.log(i);
        var notificacion = new Notification('Notificación ('+(ans.length-1-i)+' más)',{
          'body': ans[i].texto,
          'icon': '../../images/icono.png',
          'renotify':true,
          'tag':i,
          'timestamp': ans[i].hora,
          'requireInteraction':true
        });
        notificacion.onclick = function (event){
          this.close();
        };
      }
    })
    .fail(function () {
      console.log("Error en carga");
    })
});