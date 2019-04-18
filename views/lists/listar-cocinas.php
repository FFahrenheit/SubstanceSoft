<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Mostrar cocinas
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack()" href="#inicio" style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" href="#inicio" style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container text-center">
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Listado de cocinas</h1>
        <div class="row">
            <div class="container-fluid">
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                        $query = "select * from cocina";

                        $sql = mysqli_query($connection, $query) or die("error");

                        while ($row = mysqli_fetch_array($sql)) {
                                ?>
                            <tr>
                                <td><?php echo $row['nombre']; ?></td>
                            </tr>
                        <?php
                    }

                mysqli_close($connection);
                ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</body>
<script src="js/agregar-cocina.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>

</html>