<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Abrir reclamo de total
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
    <?php
        function freeQuery()
        {
            global $connection;
            do 
            {
                if ($res = $connection->store_result()) {
                  $res->free();
                }
            } while ($connection->more_results() && $connection->next_result()); 
        }

    $clave  = $_GET['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

    $query = "select platillo.nombre as name, platillo.precio as price, pedidos.estado as status
            from platillo, pedidos where pedidos.orden=$clave and platillo.clave = pedidos.platillo";

    $query = "CALL obtenerTicket($clave)";

    $sql = mysqli_query($connection, $query) or die("error en query");
    ?>
    <section class="container">
        <div class="text-center">
            <h1>Platillos pedidos y total</h1>
            &nbsp;
            <div class="row">
                <div class="col-sm">
                    Platillos pedidos:
                    <div class="containter-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Platillo</td>
                                    <td>Precio unitario</td>
                                    <td>Pedidos</td>
                                    <td>Subtotal</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['nombre']; ?></td>
                                        <td><?php echo $row['precio']; ?></td>
                                        <td><?php echo $row['conteo']; ?></td>
                                        <td><?php echo $row['subtotal']; ?></td>
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
                    freeQuery();
                    $sql = mysqli_query($connection, $query) or die("error en query");
                    $row = mysqli_fetch_array($sql);
                    ?>
                    <h4> Mesa: <?php echo $row['mesa']; ?></h4>
                    <p> Abierta por: <?php echo $row['usuario']; ?></p>
                    <p> Descripción: <?php echo $row['descripcion']; ?></p>
                    <h3> Total: <?php echo "$" . $row['total']; ?></h3>
                    <form id="reclamo">
                        <div class="form-group">
                            <label for="">Nuevo total</label>
                            <font color="red">*</font>
                            <input step=".01" name="total" type="number" value="<?php echo $row['total'] ?>" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <input id = "clave" name="clave" value="<?php echo $clave?>" hidden>
                        <button type="submit" class="btn btn-success">Nuevo total</button>
                        <button type="reset" id="again" class="btn btn-primary">Volver a calcular</button>
                    </form>
                    <p>&nbsp;</p>
                </div>
            </div>
            <button class="btn btn-primary" onclick="goBack()">Regresar</button>
        </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/forms/actualizar-total.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>