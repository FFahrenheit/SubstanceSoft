//const Push = require('push.js');

function checkNotify() {
    console.log('Cargado');

    fetch("configuration.json")
        .then(function (resp) {
            return resp.json();
        })
        .then(function (data) {
            console.log(data);
            if (!data.set) {
                console.log("No configurado para notificaciones");
            }
            else {
                var path = 'http://' + data.IP + '/substancesoft/php/requests/notificaciones.php';
                console.log(path);
                fetch(path)
                    .then(function (resp) {
                        return resp.json();
                    })
                    .then((data) => {
                        if (data == 'unlogged') {
                            console.log("La sesion no esta iniciada");
                        }
                        else if (data == 'void') {
                            console.log("No hay mensajes nuevos");
                        }
                        else if (data == 'query' || data == 'error') {
                            console.log("Error de sistema");
                        }
                        else {
                            /*Push.Permission.request(function () {
                                console.log("Si aceptó");
                            },
                                function () {
                                    console.log("No aceptó");
                                }
                            );*/

                            for (var i = 0; i < data.length; i++) {
                                console.log(i);
                                if(data.length>1)
                                {
                                    var title = 'Notificación (' + (data.length - 1 - i) + ' más)';
                                }
                                else 
                                {
                                    var title = 'Nueva notificación';
                                }
                                var notificacion = new Notification(title, {
                                    'body': data[i].texto,
                                    'icon': 'images/64x64.png',
                                    'renotify': true,
                                    'tag': i,
                                    'timestamp': data[i].hora,
                                    'requireInteraction': true
                                });
                                notificacion.onclick = function (event) {
                                    window.focus();
                                    this.close();
                                };
                                /*Push.create(data[i].texto, {
                                    icon: 'images/64x64.png',
                                    timeout: 3000,
                                    onClick: function () {
                                        window.focus();
                                        this.close();
                                    }
                                });*/
                            }
                        }
                    })
                    .catch((e) => {
                        console.log(e);
                    })
            }
        });
}

document.addEventListener("DOMContentLoaded", checkNotify);

var constantNotification = setInterval(checkNotify, 3000);