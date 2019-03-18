<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Liberar mesa y cerrar orden
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
                                   while($row = mysqli_fetch_array($sql))
                                    {
                                    ?>
                                <tr>
                                    <td><?php echo $row['name'];?></td>
                                    <td><?php echo $row['price'];?></td>
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
                        <h3> Total: <?php echo $row['total']; ?></h3> 

                        <a style="color: white;" data-toggle="modal" data-target="#delete"
                        class="btn btn-success" id="<?php echo $clave;?>" onClick="showDetails(this)">
                                                Cerrar y liberar
                        </a>
                        <p>&nbsp;</p>
                        <a href = "../../menus/index.php">
                        <button class="btn btn-primary">Cancelar</button>
                        </a>
                        </a>
                    </div>
                </div>
                <a href = "../../menus/index.php">
                <button class="btn btn-success">Regresar</button>
                </a>
            </div>
        </section>
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Eliminar registro</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Seguro que desea cerrar la orden y liberar la mesa?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-success" onClick="confirmDelete()">Liberar</button>
                            </div>
                            </div>
                        </div>
                    </div>
        </div>
    </body>
    <script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
    <script src="../../../js/vendor/popper.min.js"></script>
    <script src="../../../js/vendor/bootstrap.min.js"></script>
    <script src="../../../js/forms/functions/cerrar.js"></script>
</html>
