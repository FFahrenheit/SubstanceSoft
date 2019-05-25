<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Ver comandas
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
        <a onclick="goBack()" style="float: left;">
            <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container">
        <h1 class="text-uppercase text-center">Ver comandas</h2>
            <p class="lead text-center">Aquí puede ver las comandas.</p>
            <div class="row">
                <div align="center" class="col-sm">
                    <?php
                    $clave  = $_GET['clave'];

                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

                    $query = "select nombre from cocina where clave = $clave";
                    $sql = mysqli_query($connection, $query) or die("error en query");
                    $row = mysqli_fetch_array($sql);
                    $nCocina = $row['nombre'];

                    $query = "SELECT valor FROM preferencias WHERE nombre='notificacion_chef'";
                    $sql = mysqli_query($connection, $query);
                    $row = mysqli_fetch_array($sql);
                    $tipo = $row['valor'];


                    $query = "SELECT pedidos.clave AS pk, pedidos.estado AS estado,
                    platillo.nombre AS platillo, orden.mesa AS mesa, pedidos.hora AS hora 
                    FROM platillo, orden, pedidos  
                    WHERE platillo.clave = pedidos.platillo AND platillo.cocina = $clave
                    AND pedidos.estado != 'entregado' AND orden.clave = pedidos.orden 
                    ORDER BY pedidos.estado, pedidos.hora DESC";

                    $sql = mysqli_query($connection, $query) or die("error en query");

                    echo "<h1>Comandas para la cocina $nCocina</h1>";
                    ?>
                    <div class="containter-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Platillo</td>
                                    <td>Mesa</td>
                                    <td>Hora</td>
                                    <?php if (!$tipo || !isset($tipo)) echo '<td>Estado</td>'; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if ($sql->num_rows == 0) {
                                    echo "No hay comandas en la orden";
                                }
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['platillo']; ?></td>
                                        <td><?php switch ($row['mesa']) {
                                                case 0:
                                                    echo "Para llevar";
                                                    break;
                                                case -1:
                                                    echo "Sin mesa asignada";
                                                    break;
                                                default:
                                                    echo $row['mesa'];
                                                    break;
                                            } ?></td>
                                        <td><?php echo $row['hora']; ?></td>
                                        <?php
                                        if (!$tipo || !isset($tipo))
                                            echo "<td>" . $row['estado'] . "</td>";
                                        ?>
                                    </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                        <div class="text-center">
                            <button type="button" onclick="goBack()" class="btn btn-primary">Regresar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm">
            </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/forms/functions/notificar-comanda.js"></script>
<script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>