<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Confirmar identidad
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet">
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack(1)" style="float: left;">
            <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <?php
    $reference = $_GET['ref'];
    ?>
    <section class="container">
        <div class="text-center">
            <h1>Confirme su identidad</h1>
            <img width="200" src="../../../images/confirmar.png" alt="Recargar">
            <h3><strong>Ingrese su contraseña para proseguir:</strong></h3>
            <br>
            <div class="containter-fluid">
                <form action = "" id= "password" class="form-horizontal form-inline justify-content-center">
                    <div class="form-group">
                        <div class="col-sm-9">
                            <input name = "pass" id="pass" value = "" width="100" type="password" class="form-control" required>
                        </div>
                        <div class="col-sm-9">
                            <label><br></label>
                            <br>
                            <button class="btn btn-success">Confirmar</button>
                        </div>
                        <input id="ref" hidden value="<?php echo $reference; ?>">
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script src="../../../js/forms/functions/confirmar.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>
