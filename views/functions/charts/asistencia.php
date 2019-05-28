<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Mostrar asistencia
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet">
    <script src="../../../js/vendor/common-functions.js"></script>
    <script>
        if (window.module) module = window.module;
    </script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a href="./../modulo0-funcion1.php" style="float: left;">
            <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container text-center">
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Listado de usuarios con tarjeta de asistencia</h1>
        <div class="row">
            <div class="container-fluid">
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Username</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                        mysqli_set_charset($connection, "utf8");

                        $query = "SELECT username FROM usuario WHERE tarjeta IS NOT NULL";

                        $sql = mysqli_query($connection, $query) or die("error");

                        while ($row = mysqli_fetch_array($sql)) {
                            ?>
                            <tr>
                                <td><?php echo $row['username']; ?></td>
                                <td>
                                    <a href="asistencias.php?user=<?php echo $row['username']; ?>" class="btn btn-primary">
                                        Ver asistencias</a>
                                </td>
                            </tr>
                        <?php
                    }

                    mysqli_close($connection);
                    ?>
                    </tbody>
                </table>
                <a href="./../modulo0-funcion1.php">
                    <button type="button" class="btn btn-success">
                        Regresar
                    </button>
                </a>
            </div>
        </div>
    </section>
</body>
<script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>

</html>