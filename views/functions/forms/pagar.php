<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Pagar orden
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

        <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../../css/clean-install.css" rel="stylesheet"><script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
    </head>
    <body class="s-bg">
            <div class = "s-nb"> 
                    <a href="./../modulo3-funcion2.php"   style="float: left;">
                            <img src="../../../images/back.png" style = "width: 50px;"alt="Regresar">
                    </a>
                    <a href="../../../views/menus/index.php"><h1>SubstanceSoft</h1></a>
                    <a onclick = "refreshPage()"   style="float: left;">
                            <img src="../../../images/reload.png" alt="Recargar">
                    </a>
                </div>        <?php
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
                        <p> Clientes: <?php echo $row['clientes']; ?> </p>
                        <h3> Total: <?php echo "$".$row['total']; ?></h3> 

                        <?php 
                            if($row['estado'] == 'pagada')
                            {
                                echo '<p>La cuenta ya está pagada</p>';
                                echo '<a href="./cerrar.php?clave='.$clave.'" class="btn btn-primary">Ir a cerrar y liberar</a>';

                            }
                            else if($row['impresiones']>0)
                            {
                                echo '                        <a style="color: white;" data-toggle="modal" data-target="#delete"
                                class="btn btn-success" id="'.$clave.'" onClick="showDetails(this)">
                                                        Marcar como pagado
                                </a>';
                                echo '<br></br>';
                                echo '<a href="./cerrar.php?clave='.$clave.'" class="btn btn-primary">Ir a cerrar y liberar</a>';
                            }
                            else 
                            {
                                echo '<br></br><strong><font color="red">Debe imprimir primero la cuenta.</font><br></br></strong>';
                                echo '<button style="color: white;" class="btn btn-success" 
                                onclick="printOrder('.$clave.')" 
                                >Imprimir</button>';
                            }
                        ?>
                        <p>&nbsp;</p>
                    </div>
                </div>
                <button onclick="goBack()" class="btn btn-success">Regresar</button>
            </div>
        </section>
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Pagado</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div> 
                            <div class="modal-body">
                                ¿Marcar como pagado?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" onClick="confirmDelete()">Pagado</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>

                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    </body>
    <script src="../../../js/forms/functions/ticket.js"></script>
    <script src="../../../js/vendor/common-functions.js"></script>
    <script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
    <script src="../../../js/vendor/popper.min.js"></script>
    <script src="../../../js/vendor/bootstrap.min.js"></script>
<script>if (window.module) module = window.module;</script>
    <script src="../../../js/forms/functions/pagar.js"></script>
</html>
