<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Modificar contraseña
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

<link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
<link href="../../../css/clean-install.css" rel="stylesheet">
<script src="../../../js/vendor/common-functions.js"></script>
<script>if (window.module) module = window.module;</script>
</head>

<body class="s-bg">
<div class="s-nb">
    <a href="./../../menus/login.html" style="float: left;">
        <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
    </a>
    <a href="../../../views/menus/index.php">
        <h1>SubstanceSoft</h1>
    </a>
    <a onclick="refreshPage()"   style="float: left;">
        <img src="../../../images/reload.png" alt="Recargar">
    </a>
</div>
        <section class="container text-center">
            <?php
                session_start();
                $user = $_SESSION['username'];
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                $query = "SELECT *, AES_DECRYPT(password,'Sub5t4nc3S0Ft') AS pass from usuario where username = '$user'";
                $sql = mysqli_query($connection, $query) or die("error");
                $row = mysqli_fetch_array($sql);
            ?>
            <h1>Modificar contraseña a <?php printRow($row,'username'); ?></h1>
            <p>&nbsp;</p>
            <div class="row">
                <div class="col -8">
                <form id="formulario" novalidate>
                    <div class="form-group">
                        <label for="">Nueva contraseña: </label> <font color="red">*</font>
                        <input minlenght ="5" id="password" type="password" name="pass" value="<?php printRow($row, 'pass');?>" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Confirmar contraseña: </label> <font color="red">*</font>
                        <input minlenght ="5"id ="confirm_password" type="password" placeholder="Repita la contraseña" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                            </div>
                    </div>
                    <input name="user" value="<?php echo $row['username'];?>" type="hidden">
                    <div class="form-group">
                        <button type="submit"  class="btn btn-primary">Modificar</button>
                    </div>
                </form>
                <?php
                    mysqli_close($connection);
                    function printRow($col, $field)
                    {
                        if(isset($col[$field]))
                        {
                            echo $col[$field];
                        }
                        else
                        {
                            echo " ";
                        }
                    }
                ?>
            </div>
        </section>
    </body>
    <script src="../../../js/vendor/validate-form.js"></script>
    <script src="../../../js/forms/nueva-pass.js"></script>
    <script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../../js/vendor/popper.min.js"></script>
    <script src="../../../js/vendor/bootstrap.min.js"></script>
</html>
