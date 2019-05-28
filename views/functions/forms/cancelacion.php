<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Cancelar comanda
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

        <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../../css/clean-install.css" rel="stylesheet"><script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
        <script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
    </head>
    <body class="s-bg">
            <div class = "s-nb"> 
                    <a href="./../modulo1-funcion2.php"  style="float: left;">
                            <img src="../../../images/back.png" style = "width: 50px;"alt="Regresar">
                    </a>
                    <a href="../../../views/menus/index.php"><h1>SubstanceSoft</h1></a>
                    <a onclick = "refreshPage()"   style="float: left;">
                            <img src="../../../images/reload.png" alt="Recargar">
                    </a>
                </div>
        <section class="container">
            <h1 class="text-uppercase text-center">Cancelar comanda</h2>
            <p class="lead text-center">Aquí puede cancelar comandas. Solo puede realizar cancelaciones en órdenes no listas.</p>
            <div class="row">
                <div class="col-sm">
                <?php
                    $clave  = $_GET['clave'];

                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

                    $query = "select platillo.nombre as name, pedidos.clave as pk, platillo.precio as price, pedidos.estado as status
                    from platillo, pedidos where pedidos.orden=$clave and platillo.clave = pedidos.platillo";

                    $sql = mysqli_query($connection, $query) or die("error en query");

                    echo "Comandas para la orden $clave";
                ?>                    
                    <div class="containter-fluid">
                        <table class="table table-hover">
                        <thead>
                            <tr>
                                <td>Platillo</td>
                                <td>Precio</td>
                                <td>Estado</td>
                                <td> &nbsp;</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                if($sql->num_rows==0)
                                {
                                    echo "No hay comandas en la orden";
                                }
                                while($row = mysqli_fetch_array($sql))
                                {
                                ?>
                            <tr>
                                <td><?php echo $row['name'];?></td>
                                <td><?php echo $row['price'];?></td>
                                <td><?php echo $row['status'];?></td>
                                <td>
                                    <?php 
                                        if($row['status']=='pedido')
                                        {
                                            echo '<a style="color: white;" data-toggle="modal" data-target="#delete"
                                            class="btn btn-danger" id="'.$row['pk'].'" onClick="showDetails(this)">
                                                Cancelar
                                            </a>';
                                        }
                                    ?>
                                </td>
                            </tr>
                            <?php
                                }
                            ?>
                        </tbody>
                        </table>
                       <div  class="text-center"> 
                        <!--button type="button" onclick="goBack()" class="btn btn-success">Regresar</button-->
                        </div>
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
                                ¿Seguro que desea cancelar la comanda?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" onClick="confirmDelete()">Eliminar</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script src="../../../js/vendor/common-functions.js"></script>
    <script src="../../../js/forms/functions/cancelar-comanda.js"></script>
    <script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../../js/vendor/popper.min.js"></script>
    <script src="../../../js/vendor/bootstrap.min.js"></script>
    <script>if (window.module) module = window.module;</script>
</html>
