document.addEventListener('DOMContentLoaded', () => {
    fetch("configuration.json")
        .then((resp) => {
            return resp.json();
        })
        .then((data) => {
            console.log(data);
            if (!data.set) {
                console.log("Not set yet");
                window.location.pathname = 'setup.html'
            }
            else {
                var link = 'http://' + data.IP + '/substancesoft/php/requests/conectividad.php';
                fetch(link)
                    .then(function (resp) {
                        return resp.json();
                    })
                    .then(function (response) {
                        if (response == 'success') {
                            if (data.type == 'central') {
                                console.log('Aún no soportado xd');
                                var path = 'http://localhost/substancesoft/views/menus/index.php';
                                window.location.href = path;
                            }
                            else {
                                var path = 'http://' + data.IP + '/substancesoft/views/menus/index.php';
                                window.location.href = path;
                            }

                        }
                        else {
                            alert('No se pudo conectar al servidor');
                            window.location.reload(false);
                        }
                    })
                    .catch((e) => {
                        console.log(e);
                        alert('No se pudo conectar al servidor');
                        window.location.reload(false);
                    });
            }
        });
}
    , false);