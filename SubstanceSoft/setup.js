var central = document.getElementById('setup');
var IP = document.getElementById('ip');
var connect = document.getElementById('connect');

central.addEventListener("click", function () {
    var testConnection = 'http://localhost/substancesoft/php/requests/conectividad.php';
    fetch(testConnection)
        .then(function (resp) {
            return resp.json();
        })
        .then(function (data) {
            if (data == 'success') {
                var link = 'http://localhost/substancesoft/views/menus/index.html';
                console.log(link);

                var conf = {
                    "set":true,
                    "IP":"localhost",
                    "type":"central"
                };

                var stringData = JSON.stringify(conf);

                const fs = require('fs');

                fs.writeFile("configuration.json", stringData, function (err) {
                    if (err) {
                        console.log(err);
                        return;
                    }
                    console.log("Guardado!");
                });

                window.location.href = link;
            }
            else {
                alert('El servidor no está configurado correctamente');
            }
        })
        .catch(function () {
            alert('No hay respuesta por parte del servidor');
            console.log("catch");
        })
    //window.location.href = link;
});

connect.addEventListener("click", function ()
{
    var regex = /(^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$)/;
    if( IP.value.toLowerCase() != 'localhost' && !regex.test(IP.value))
    {
        console.log(IP.value);
        alert('Formato de IP incorrecto');
        return;
    }
    var testConnection = 'http://' + IP.value + '/substancesoft/php/requests/conectividad.php';
    fetch(testConnection)
        .then(function (resp) {
            return resp.json();
        })
        .then(function (data) {
            if (data == 'success') {
                var link = 'http://' + IP.value + '/substancesoft/views/menus/index.php';
                console.log(link);

                var conf =
                {
                    "set":true,
                    "type":"client",
                    "IP":IP.value
                };

                stringConf = JSON.stringify(conf);

                const fs = require('fs');

                fs.writeFile("configuration.json", stringConf, function (err) {
                    if (err) {
                        console.log("Error al escribir");
                        console.log(err);
                        return;
                    }
                    console.log("Guardado!");
                });

                window.location.href = link;
            }
            else {
                alert('No hay respuesta por parte del servidor o aún no está configurado correctamente');
            }
        })
        .catch(function (e) {
            console.log(e);
            alert('No hay respuesta por parte del servidor');
            console.log("catch");
        })
    //window.location.href = link;
});
