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
      console.log(respuesta);
    })
    .fail(function () {
      console.log("Error en carga");
    })
});