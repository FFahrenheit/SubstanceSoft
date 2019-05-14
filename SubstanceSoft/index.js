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
                var datos = new FormData();
                var ip = getIp();
                datos.append("ip",ip);
                var link = 'http://' + data.IP + '/substancesoft/php/requests/conectividad.php';
                fetch(link,
                    {
                        method: 'POST',
                        body: datos
                    })
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

function getIp() {
    var os = require('os');
    var networkInterfaces = Object.values(os.networkInterfaces())
        .reduce((r, a) => {
            r = r.concat(a)
            return r;
        }, [])
        .filter(({ family, address }) => {
            return family.toLowerCase().indexOf('v4') >= 0 &&
                address !== '127.0.0.1'
        })
        .map(({ address }) => address);
    for (var i = 0; i < networkInterfaces.length; i++) {
        if (networkInterfaces[i] != '192.168.137.1') {
            return networkInterfaces[i];
        }
    }
    var ipAddresses = networkInterfaces.join(', ')
    console.log(ipAddresses);
    return '0.0.0.0';
}