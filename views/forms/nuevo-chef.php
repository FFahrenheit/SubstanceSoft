<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar permisos a usuarios.
        </title>

        <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="container text-center">
        <p>&nbsp;</p>
            <h1 class="text-uppercase text-center">Listado de usuarios</h1>
            <div class="row">
                <div class="container-fluid">
                    <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre de usuario</td>
                            <td>Tipo de usuario</td>
                            <td>Modificar</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                            $query = "select usuario.username as username, tipo from usuario, permisos where permisos.permiso=2
                            and usuario.username = permisos.username";

                            $sql = mysqli_query($connection, $query) or die("error");

                            while($row = mysqli_fetch_array($sql))
                            {
                        ?>
                        <tr>
                            <td><?php echo $row['username']; ?></td>
                            <td><?php echo $row['tipo'];?></td>
                            <?php 
                                if($row['tipo']=='administrador')
                                {
                                    echo "<td>No gestionable</td>";
                                }
                                else
                                {
                                    echo "<td> <a href='nuevo-cocinero.php?user=".$row['username']."' class='btn btn-primary'>Gestionar</a> </td>";
                                }
                            ?>
                        </tr>
                        <?php
                            }
                            mysqli_close($connection);
                        ?>
                    </tbody>
                    </table>
                </div>
            </div>
        </section>
    </body>
    <script src="../../js/forms/eliminar-usuario.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
