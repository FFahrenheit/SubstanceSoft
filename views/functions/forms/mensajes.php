<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Historial de mensajes
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet"><script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack()"   style="float: left;">
            <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()"   style="float: left;">
            <img src="../../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <?php
    $clave  = $_GET['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");
    mysqli_set_charset($connection, "utf8");

    $query = "SELECT * FROM mensajes WHERE destinatario = '$clave' ORDER BY fecha DESC LIMIT 20";

    $sql = mysqli_query($connection, $query) or die("error en la query");

    ?>
    <section class="container">
        <div class="text-center">
            <h1>Últimos mensajes</h1>
            &nbsp;
            <?php      
                if($sql->num_rows==0) 
                {
                    echo '<h4> Actualmente no tiene mensajes </h4>';
                }
            ?>
            Historial de mensajes:
            <div class="containter-fluid">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>Hora</td>
                            <td>Mensaje</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        while ($row = mysqli_fetch_array($sql)) {
                            ?>
                            <tr>
                                <td><?php echo $row['fecha']; ?></td>
                                <td><?php echo $row['texto']; ?></td>
                            </tr>
                        <?php
                    }
                    ?>
                    </tbody>
                </table>

            </div>
            <button class="btn btn-success" onclick="goBack()">Regresar</button>
        </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>if (window.module) module = window.module;</script>

</html>