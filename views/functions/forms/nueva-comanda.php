<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar platillos a orden
        </title>

        <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../../css/clean-install.css" rel="stylesheet">
    </head>
    <body>
        <?php
            $clave  = $_GET['clave'];

            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

            $query = "select platillo.nombre as name, platillo.precio as price, pedidos.estado as status
            from platillo, pedidos where pedidos.orden=$clave and platillo.clave = pedidos.platillo";

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
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                   while($row = mysqli_fetch_array($sql))
                                    {
                                    ?>
                                <tr>
                                    <td><?php echo $row['name'];?></td>
                                    <td><?php echo $row['price'];?></td>
                                    <td><?php echo $row['status'];?></td>
                                </tr>
                                <?php
                                    }
                                ?>
                            </tbody>
                                </table>
                    </div>
                </div>
                    <div class="col-sm">
                        Agregar platillos: &nbsp;
                        <?php
                            //$query = "select * from funcion where
                            //clave not in(select permiso from permisos where username='$user') order by descripcion asc";

                            $sql = mysqli_query($connection, $query) or die("error en query");
                        ?>
                    <form id="formulario" novalidate>
                        <div class="form-group">
                            <label for=""> Platillo:  </label>
                            <input type="text" name="search" id="search" class="form-control" placeholder="Escriba su busqueda aquí">
                        </div>
                        <div id="busqueda" align="left" class="form-group">
                        <div class="invalid-feedback">
                                Ingresa datos
                        </div>
                        </div>
                        <div class="form-group">
                                <label for="">Cantidad:  </label>
                                <input name="qty" type="number" value="1" class="form-control" required>
                                <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <input name="clave" hidden value="<?php echo $clave ?>">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Agregar</button>
                        </div>
                    </form>
                    </div>
                </div>
                <a href = "../modulo1-funcion1.php">
                <button class="btn btn-success">Continuar</button>
                </a>
            </div>
        </section>
    </body>
    <script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
    <script src="../../../js/vendor/validate-form.js"></script>
    <script src="../../../js/vendor/popper.min.js"></script>
    <script src="../../../js/vendor/bootstrap.min.js"></script>
    <script src="../../../js/forms/functions/nueva-comanda.js"></script>
</html>
