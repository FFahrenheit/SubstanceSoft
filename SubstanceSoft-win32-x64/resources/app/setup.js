var central = document.getElementById('setup');
var IP = document.getElementById('ip');
var connect = document.getElementById('connect');
var alias = document.getElementById('alias');

document.addEventListener("DOMContentLoaded", ()=>
{
    var reconf =
            {
              "set": false
            };

    reconfJSON = JSON.stringify(reconf);
    localStorage.setItem('configuration', reconfJSON);
});

central.addEventListener("click", function () {
    var testConnection = 'http://localhost/substancesoft/php/requests/conectividad.php';
    var datos = new FormData();
    var ip = getIp();
    datos.append("ip",ip);
    fetch(testConnection, 
        {
            method: 'POST',
            body: datos
        })
        .then(function (resp) 
        {
            return resp.json();
        })
        .then(function (data) 
        {
            if (data == 'success') {
                var link = 'http://localhost/substancesoft/views/menus/index.html';
                console.log(link);

                var conf = {
                    "set":true,
                    "IP":"localhost",
                    "type":"central"
                };

                var stringData = JSON.stringify(conf);

                localStorage.setItem('configuration', stringData);
                
                window.location.href = link;
            }
            else {
                alert('El servidor no está configurado correctamente');
            }
        })
        .catch( (e) => {
          console.log(e)
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
    var datos = new FormData();
    var ip = getIp();
    datos.append("ip",ip);
    datos.append("alias", alias.value);
    fetch(testConnection, 
        {
            method: 'POST',
            body: datos
        })
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

                localStorage.setItem('configuration', stringConf);

                window.location.href = link;
            }
            else {
                alert('No hay respuesta por parte del servidor o aun no esta configurado correctamente');
            }
        })
        .catch(function (e) {
            console.log(e);
            alert('No hay respuesta por parte del servidor');
            console.log("catch");
        })
    //window.location.href = link;

});


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
    return '127.0.0.1';
}