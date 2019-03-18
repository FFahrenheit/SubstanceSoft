<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Mostrar cocinas
        </title>

        <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="container text-center">
        <p>&nbsp;</p>
            <h1 class="text-uppercase text-center">Listado de cocinas</h1>
            <div class="row">
                <div class="container-fluid">
                    <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre de cocina</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                            $query = "select nombre from cocina";

                            $sql = mysqli_query($connection, $query) or die("error");

                            while($row = mysqli_fetch_array($sql))
                            {
                        ?>
                        <tr>
                            <td><?php echo $row['nombre']; ?></td>
                            <td> <a href="modificar-cocina-form.php?nombre=<?php echo $row['nombre']?>" class="btn btn-primary">Modificar</a> </td>
                            <td>
                                <a style="color: white;"data-toggle="modal" data-target="#delete"
                                class="btn btn-danger" id="<?php echo $row['nombre']?>" onClick="showDetails(this)">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <?php
                            }
                            mysqli_close($connection);
                        ?>
                    </tbody>
                    </table>
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
                                ¿Seguro que desea eliminar al usuario?
                                <br>
                                Los platillos que estén en esta cocina también serán elimiados
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" onClick="confirmDelete()">Eliminar</button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script src="../../js/forms/eliminar-cocina.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
