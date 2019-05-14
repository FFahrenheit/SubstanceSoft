<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>
            Agregar nuevo usuario
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

<link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
<link href="../../css/clean-install.css" rel="stylesheet">
<script src="../../js/vendor/common-functions.js"></script>
<script>if (window.module) module = window.module;</script>
</head>

<body class="s-bg">
<div class="s-nb">
    <a onclick="goBack(1)"   style="float: left;">
        <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
    </a>
    <a href="../../views/menus/index.php">
        <h1>SubstanceSoft</h1>
    </a>
    <a onclick="refreshPage()"   style="float: left;">
        <img src="../../images/reload.png" alt="Recargar">
    </a>
</div>
        <section class="container">
            <h1 class="text-uppercase text-center">Agregar usuario</h2>
            <p class="lead text-center">Por favor, llene los campos con la información requerida. Los campos marcados con <font color="red">*</font> son obligatorios.</p>
            <div class="row">
                <div class="col-8">
                    <form id="formulario" novalidate onsubmit='return check();'>
                        <div class="form-group">
                            <label for="">Nombre de usuario:  </label> <font color="red">*</font>
                            <input id="usu" name="usu" type="text" placeholder="Escriba el nombre para iniciar sesión en el sistema" class="form-control" required onkeyup="validate_regex();">
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                            <span id="mensaje"></span>
                        </div>
                        <div class="form-group">
                            <label for="">Contraseña: </label> <font color="red">*</font>
                            <input id="password"type="password" name="pas" placeholder="Escriba la contraseña que usará para iniciar sesión" class="form-control" required onkeyup="check();">
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Confirmar contraseña: </label> <font color="red">*</font>
                            <input type="password" id="confirm_password" onkeyup="check();"placeholder="Repita la contraseña" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                              </div>
                              <span id="message"></span>
                        </div>
                        <div class="form-group">
                            <label for="">Nombre del usuario: </label>
                            <input name="nom"type="text" placeholder="Escriba el nombre del administrador" class="form-control">
                        </div>
                        <div class="form-group">
                                <label for="">Apellido paterno del usuario: </label>
                                <input name="pat" type="text" placeholder="Escriba el apellido paterno del administrador" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Apellido materno del usuario</label>
                            <input name ="mat" type="text" placeholder="Escriba el apellido materno del administrador" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Teléfono de contacto</label>
                            <input name="tel" type="number"  value=0 placeholder="Escriba el teléfono de contacto del administrador" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Dirección:</label>
                            <input name="dir" type="text" placeholder="Escriba la dirección del administrador / restaurante." class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Tipo de usuario</label> <font color="red">*</font>
                            <select class="form-control" name="tip">
                                <?php
                                    session_start();
                                    if($_SESSION['tipo']=='admin')
                                    {
                                        echo '<option>administrador</option>
                                        <option>empleado</option>';
                                    }
                                    else
                                    {
                                        echo '<option>empleado</option>';
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-danger">Continuar</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
    <script src="../../js/vendor/validate-form.js"></script>
    <script src="../../js/forms/agregar-usuario.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
