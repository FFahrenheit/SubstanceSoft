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
    <link href="../../../css/index.css" rel="stylesheet">
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
            <?php
            include($_SERVER['DOCUMENT_ROOT'] . '/substancesoft/php/functions/chef.php');
            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");
            $query = "SELECT valor FROM preferencias WHERE nombre = 'ayuda_chefs'";
            $result = mysqli_query($connection, $query);
            $row = mysqli_fetch_array($result);
            $ayuda = $row['valor'];

            $class = $ayuda ? "col-9" : "col-sm";
            ?>
            <div class="row">
                <div class="<?php echo $class; ?>">
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
                    </div>
                </div>
            <?php
            if ($ayuda) {
                echo '<div class="col-3" align="center">';
                echo '<button class="btn btn-primary" value="' . $clave . '" onclick="askForHelp(this)"> Pedir ayuda </button>';
                echo '<div>';
                echo getMessages($clave);
                echo '</div>';
                echo '</div>';
            }
            mysqli_close($connection);
            ?>
            </div>
            
            <div class="text-center">
                <button type="button" class="btn btn-primary" onclick="goBack()">Regresar</button>
            </div>
    </section>
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Marcar</h5>
                    <button type="button" onclick="cont()" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ¿Seguro que desea marcar como lista la comanda?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onClick="confirmDelete()">Marcar como lista</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="cont()">Cancelar</button>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ayuda" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ayuda</h5>
                    <button type="button" onclick="cont()" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="cocinas" align="center">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="cont()">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/forms/functions/notificar-comanda.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>