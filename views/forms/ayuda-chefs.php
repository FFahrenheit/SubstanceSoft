<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Gestionar desperdicio
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
    <script src="../../js/forms/gestionar-preferencia.js"></script>
    <script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>    <script src="../../js/forms/gestionar-preferencia.js"></script>
</head>
  
<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack()" style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container text-center">
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Sistema de ayuda chefs</h1>
        <p>
            Active esta preferencia para permitir a sus chefs pedir ayuda cuando la demanda sea exigente.
            <br>El sistema de ayuda tomará en cuenta los chefs trabajando en el momento para decidir si es conveniente 
            solicitar la ayuda a otras cocinas.
            <br>La alerta sólo se enviará a las cocinas si, basado en el trabajo actual, es más demandante el trabajo
            de la cocina solicitante.
        </p>
        <div class="row">
            <div class="container-fluid">
                <?php
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                $query = "SELECT valor FROM preferencias WHERE nombre='ayuda_chefs'";

                $result = mysqli_query($connection, $query) or die('"error al ejecutar"');

                $row = mysqli_fetch_array($result);

                if (!isset($row['valor']) || $row['valor'] == 0) 
                {
                    echo '<h2>Actualmente la ayuda se encuentra <strong>deshabilitada</strong></h2>';
                    echo '<img height = "20%" src="../../images/switch.png" alt="Cambiar">';
                    echo '<h3>Presione el botón para cambiar de modo</h3>';
                    echo '<button type="button" onclick = "setCodeStatus(true,'."'ayuda_chefs'".')" class="btn btn-primary">Cambiar</button> ';
                }
                else 
                {
                    echo '<h2>Actualmente la ayuda se encuentra <strong>habilitada</strong></h2>';
                    echo '<img height = "20%" src="../../images/switch.png" alt="Cambiar">';
                    echo '<h3>Presione el botón para cambiar de modo</h3>';
                    echo '<button type="button" onclick = "setCodeStatus(false,'."'ayuda_chefs'".')" class="btn btn-primary">Cambiar</button> ';
                }
                mysqli_close($connection);
                ?>
            </div>
        </div>
    </section>
</body>
<script src="../../js/vendor/validate-form.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>
<script>if (window.module) module = window.module;</script>
</html>