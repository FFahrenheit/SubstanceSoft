<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">
        <meta http-equiv="refresh" content="5" >

        <title>
            Notificar comandas
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />
        
        <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../../css/clean-install.css" rel="stylesheet">
    </head>
    <body class="s-bg">
            <div class = "s-nb"> 
                    <a onclick = "goBack()"   style="float: left;">
                            <img src="../../../images/back.png" style = "width: 50px;"alt="Regresar">
                    </a>
                    <a href="../../../views/menus/index.php"><h1>SubstanceSoft</h1></a>
                    <a onclick = "refreshPage()"   style="float: left;">
                            <img src="../../../images/reload.png" alt="Recargar">
                    </a>
                </div>        <section class="container">
            <h1 class="text-uppercase text-center">Ver comandas</h2>
            <p class="lead text-center">Aquí puede ver las comandas.</p>
            <div class="row">
                <div class="col-sm">
                <?php
                    $clave  = $_GET['clave'];

                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

                    $query = "select nombre from cocina where clave = $clave";
                    $sql = mysqli_query($connection, $query) or die("error en query");
                    $row = mysqli_fetch_array($sql);
                    $nCocina = $row['nombre'];

                    $query = "select pedidos.clave as pk, 
                    platillo.nombre as platillo, orden.mesa as mesa, pedidos.hora as hora 
                    from platillo, orden, pedidos 
                    where platillo.clave = pedidos.platillo and platillo.cocina = $clave
                    and pedidos.estado = 'pedido' and orden.clave = pedidos.orden order by pedidos.estado";

                    $sql = mysqli_query($connection, $query) or die("error en query");

                    echo "Comandas para la cocina $nCocina";
                ?>                    
                    <div class="containter-fluid">
                        <table class="table table-hover">
                        <thead>
                            <tr>
                                <td>Platillo</td>
                                <td>Mesa</td>
                                <td>Hora</td>
                                <td>Marcar</td>
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
                                <td><?php echo $row['platillo'];?></td>
                                <td><?php echo $row['mesa'];?></td>
                                <td><?php echo $row['hora'];?></td>
                                <td>
                                    <?php 
                                            echo '<a style="color: white;" data-toggle="modal" data-target="#delete"
                                            class="btn btn-success" id="'.$row['pk'].'" onClick="showDetails(this)">
                                                Lista
                                            </a>';
                                    ?>
                                </td>
                            </tr>
                            <?php
                                }
                            ?>
                        </tbody>
                        </table>
                       <div  class="text-center"> 
                        <button type="button" class="btn btn-primary" onclick="goBack()">Regresar</button>
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
                                ¿Seguro que desea marcar como lista la comanda?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="cont()">Cancelar</button>
                                <button type="button" class="btn btn-success" onClick="confirmDelete()">Marcar como lista</button>
                            </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script src="../../../js/vendor/common-functions.js"></script
    <script src="../../../js/forms/functions/notificar-comanda.js"></script>
    <script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../../js/vendor/popper.min.js"></script>
    <script src="../../../js/vendor/bootstrap.min.js"></script>
</html>
