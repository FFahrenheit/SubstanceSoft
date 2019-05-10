<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Agregar platillos a orden
    </title>
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>
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
    if(isset($_GET['drive']) && $_GET['drive']==1)
    {
        $drive = $_GET['drive'];
    }
    else 
    {
        $drive = 0;
    }
    $clave  = $_GET['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

    $query = "select platillo.nombre as name, platillo.precio as price, pedidos.estado as status, count(*) as conteo
    from platillo, pedidos where pedidos.orden=$clave and platillo.clave = pedidos.platillo GROUP BY name, status";

    $sql = mysqli_query($connection, $query) or die("error en query");
    ?>
    <section class="container">
        <div class="text-center">
            <h1>Agregar platillos a la orden</h1>
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
                                    <td>Estado</td>
                                    <td>Total</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['name']; ?></td>
                                        <td><?php echo $row['price']; ?></td>
                                        <td><?php echo $row['status']; ?></td>
                                        <td><?php echo $row['conteo']; ?></td>
                                    </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm">
                    <form id="formulario2" novalidate>
                        Agregar platillos: &nbsp;
                        <div id="actual">
                            <!--Autogenerado-->
                        </div>
                        <div id="plato">
                        <input name="platillo" id="platillo" hidden required></input>
                        </div>
                        <div class="form-group">
                            <label for=""> Platillo: </label>
                            <p class="comm">&nbsp;Elija la categoria:</p>
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-danger round" onclick="buscarCategoria('Bebidas');">
                                    <input type="radio" name="options" class="hide">Bebidas
                                </label>
                                <label class="btn btn-warning round" onclick="buscarCategoria('Guisados')" ;>
                                    <input type="radio" name="options" class="hide">Guisados
                                </label>
                                <label class="btn btn-danger round" onclick="buscarCategoria('Postres');">
                                    <input type="radio" name="options" class="hide">Postres
                                </label>
                                <label class="btn btn-warning round" onclick="buscarCategoria('Rapida');">
                                    <input type="radio" name="options" class="hide">Rapida
                                </label>
                                <label class="btn btn-danger round" onclick="buscarCategoria('Sopas');">
                                    <input type="radio" name="options" class="hide">Sopas
                                </label>
                                <label class="btn btn-warning round" onclick="buscarCategoria('Otros');">
                                    <input type="radio" name="options" class="hide">Otros
                                </label>
                            </div>
                            <p class="comm">&nbsp;O busque su platillo:</p>
                            <input type="text" name="search" id="search" class="form-control" placeholder="Escriba su busqueda aquí">
                    </form>

                </div>
            </div>
            <div class="col-sm">
                <form id="formulario" novalidate>
                    <div id="busqueda" align="center" class="form-group" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Cantidad: </label>
                        <input name="qty" id = "qty" type="number" value="1" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                        </div>
                    </div>
                    <input name="clave" id="clave" hidden value="<?php echo $clave; ?>">
                    <input name="drive" id="drive" hidden value="<?php echo $drive; ?>">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Agregar</button>
                    </div>
                </form>
                <button class="btn btn-success" onclick="goBackDrive()">Continuar</button>
            </div>
        </div>
        </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/vendor/validate-form.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script src="../../../js/forms/functions/nueva-comanda.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>