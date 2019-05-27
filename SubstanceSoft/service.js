function checkNotify() {
    console.log('Cargado');
    data = localStorage.getItem('configuration');
    data = JSON.parse(data);
    console.log(data);
    if (!data.set) 
    {
        console.log("No configurado para notificaciones");
    }
    else 
    {
        var path = 'http://' + data.IP + '/substancesoft/php/requests/notificaciones.php';
        console.log(path);
        fetch(path)
            .then(function (resp) 
            {
                return resp.json();
            })
            .then((data) => 
            {
                switch (data) 
                {
                    case 'unlogged':
                        console.log("La sesion no esta iniciada");
                        break;
                    case 'void':
                        console.log("No hay mensajes nuevos");
                        break;
                    case 'query':
                    case 'error':
                        console.log("Error de sistema");
                        break;
                    default:
                        for (var i = 0; i < data.length; i++) {
                            console.log(i);
                            if (data.length > 1) 
                            {
                                var title = 'Notificación (' + (data.length - 1 - i) + ' más)';
                            }
                            else 
                            {
                                var title = 'Nueva notificación';
                            }
                            var notificacion = new Notification(title, 
                                {
                                'body': data[i].texto,
                                'icon': 'images/64x64.png',
                                'renotify': true,
                                'tag': i,
                                'timestamp': data[i].hora,
                                'requireInteraction': true
                            });
                            notificacion.onclick = (e)=>
                            {
                                window.focus();
                                this.close();
                            };
                        }
                        break;
                }
            })
            .catch((e) => 
            {
                console.log(e);
            })
    }
}

document.addEventListener("DOMContentLoaded", checkNotify);

var constantNotification = setInterval(checkNotify, 3000);