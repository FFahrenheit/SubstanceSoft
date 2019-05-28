<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Imprimir ticket
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
        <a href="./../modulo3-funcion1.php" style="float: left;">
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
    $drive = (isset($_GET['drive']) && $_GET['drive'] == 1) ? 1 : 0;
    $clave  = $_GET['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

    if ($drive == 1) {
        $query = "update orden set estado='cerrada' where clave = $clave ";

        $result = mysqli_query($connection, $query) or die("Error al cerrar platillos");

        $query = "update pedidos set estado='entregado' where orden = $clave ";

        $result = mysqli_query($connection, $query) or die('"Error al cerrar platillos"');
    }

    $query = "select platillo.nombre as name, platillo.precio as price, pedidos.estado as status
            from platillo, pedidos where pedidos.orden=$clave and platillo.clave = pedidos.platillo";

    $sql = mysqli_query($connection, $query) or die("error en query");
    ?>
    <section class="container">
        <div class="text-center">
            <h1>Resumen de platillos pedidos</h1>
            &nbsp;
            <div class="row">
                <div class="col-sm">
                    Platillos pedidos:
                    <div class="containter-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Platillo</td>
                                    <td>Precio</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['name']; ?></td>
                                        <td><?php echo $row['price']; ?></td>
                                    </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm">
                    <h1> Resumen de cuenta: &nbsp; </h1>
                    <?php
                    $query = "select * from orden where clave = $clave";

                    $sql = mysqli_query($connection, $query) or die("error en query");
                    $row = mysqli_fetch_array($sql);
                    ?>
                    <h4> Mesa: <?php echo $row['mesa']; ?></h4>
                    <p> Abierta por: <?php echo $row['usuario']; ?></p>
                    <p> Descripción: <?php echo $row['descripcion']; ?></p>
                    <p> Clientes: <?php echo $row['clientes']; ?> </p>
                    <h3> Total: <?php echo "$" . $row['total']; ?></h3>
                    <p>&nbsp;</p>
                    <button type="submit" onclick="printOrder(<?php echo $clave ?>)" class="btn btn-primary">
                        <?php
                        if ($row['impresiones'] == 0) {
                            echo 'Imprimir';
                        } else {
                            echo 'Reimprimir';
                        }
                        ?>
                    </button>
                </div>
            </div>
            <button onclick="goBackDrive()" class="btn btn-success">Regresar</button>
        </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script>
    function goBackDrive() {
        if (<?php echo $drive; ?> === 1) {
            console.log("Si es drive");
            var path = '/substancesoft/views/menus/index.php';
            window.location.pathname = path;
        } else {
            console.log("No es drive");
            window.history.back();
        }
    }
</script>
<script src="../../../js/forms/functions/ticket.js"></script>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>