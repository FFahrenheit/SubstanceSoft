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

                const fs = require('fs');

                fetch("configuration.json")
                    .then(function (resp) {
                        return resp.json();
                    })
                    .then(function (data) {
                        data.set = true;
                        data.IP = 'localhost';
                        data.type = "central";

                        stringData = JSON.stringify(data);

                        fs.writeFile("configuration.json", stringData, function (err) {
                            if (err) {
                                console.log(err);
                                return;
                            }
                            console.log("Guardado!");
                        });

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

connect.addEventListener("click", function () {
    var testConnection = 'http://' + IP.value + '/substancesoft/php/requests/conectividad.php';
    fetch(testConnection)
        .then(function (resp) {
            return resp.json();
        })
        .then(function (data) {
            if (data == 'success') {
                var link = 'http://' + IP.value + '/substancesoft/views/menus/index.php';
                console.log(link);

                const fs = require('fs');

                fetch("configuration.json")
                    .then(function (resp) {
                        return resp.json();
                    })
                    .then(function (data) {
                        data.set = true;
                        data.IP = IP.value;
                        data.type = "client";

                        stringData = JSON.stringify(data);

                        fs.writeFile("configuration.json", stringData, function (err) {
                            if (err) {
                                console.log(err);
                                return;
                            }
                            console.log("Guardado!");
                        });

                    });
                window.location.href = link;
            }
            else {
                alert('No hay respuesta por parte del servidor o aún no está configurado correctamente');
            }
        })
        .catch(function () {
            alert('No hay respuesta por parte del servidor');
            console.log("catch");
        })
    //window.location.href = link;
});