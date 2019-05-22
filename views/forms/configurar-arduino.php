<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
        Configurar módulo Arduino
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
    <script>
        if (window.module) module = window.module;
    </script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack(1)" style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container">
        <h1 class="text-uppercase text-center">Configurar modulo sistema de empleados</h2>
            <div class="lead text-center">
                <strong>Continúe bajo su propio riesgo (Solo personal capacitado)</strong>
                <p>Bienvenido, aquí configura las credenciales de SSID, contraseña y
                    <br> dirección del servidor en el módulo de Arduino. Conecte el módulo a
                    <br> su computadora, seleccione el puerto y coloque el switch en modo configuración
                    <br>Si escucha tres pitidos tras configurar, se ha completado el proceso con éxito
                </p>
            </div>
            <div class="row">
                <div class="col-8">
                    <form id="formulario" novalidate onsubmit='return check();'>
                        <div class="form-group">
                            <label for="">Puerto: </label>
                            <font color="red">*</font>
                            <input id="ss" name="port" type="text" placeholder="Puerto del módulo" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                            <span id="mensaje"></span>
                        </div>
                        <div class="form-group">
                            <label for="">SSID: </label>
                            <font color="red">*</font>
                            <input id="ss" name="ssid" type="text" placeholder="SSID del WiFi" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                            <span id="mensaje"></span>
                        </div>
                        <div class="form-group">
                            <label for="">Contraseña: </label>
                            <font color="red">*</font>
                            <input id="ss" name="password" type="text" placeholder="Contraseña del WiFi" class="form-control">
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                            <span id="mensaje"></span>
                        </div>
                        <div class="form-group">
                            <label for="">IP del servidor: </label>
                            <font color="red">*</font>
                            <input id="ss" name="server" type="text" placeholder="IP del equipo central" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                            <span id="mensaje"></span>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Continuar</button>
                        </div>
                    </form>
                </div>
            </div>
    </section>
</body>
<script src="../../js/vendor/validate-form.js"></script>
<script src="../../js/forms/configurar-arduino.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>