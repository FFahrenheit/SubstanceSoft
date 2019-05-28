<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Tarjetas en el sistema
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />
    <script>if (window.module) module = window.module;</script>

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
    <script src="../../js/forms/generar-codigo.js"></script>
    <script src="../../js/forms/gestionar-preferencia.js"></script>

</head>

<body class="s-bg">
    <div class="s-nb">
        <a href="./../functions/modulo0-funcion0.php"  style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()"   style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container text-center">
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Listado de tarjetas habilitadas</h1>
        <div class="row">
            <div class="container-fluid">
                <?php 
                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                ?>
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre</td>
                            <td>Código tarjeta</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $query = "SELECT username, tarjeta FROM usuario WHERE tarjeta IS NOT NULL ORDER BY username";

                        $sql = mysqli_query($connection, $query) or die("error");

                        while ($row = mysqli_fetch_array($sql)) {
                                ?>
                            <tr>
                                <td><?php echo $row['username']; ?></td>
                                <td><?php echo $row['tarjeta']; ?></td>
                            </tr>
                        <?php
                    }

                mysqli_close($connection);
                ?>
                    </tbody>
                </table>
                <!--button type="button" onclick = "goBack()" class="btn btn-primary">Regresar</button-->

            </div>
        </div>
    </section>
</body>
<script src="../../js/vendor/common-functions.js"></script>
<script src="../../js/forms/generar-codigo.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>

</html>