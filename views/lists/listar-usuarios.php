<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">
        
        <title>
            Mostrar usuarios
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
                            <td>Username</td>
                            <td>Contraseña</td>
                            <td>Tipo</td>
                            <td>Nombre</td>
                            <td>Dirección</td>
                            <td>Número</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                            $query = "select * from usuario"; 

                            $sql = mysqli_query($connection, $query) or die("error");

                            while($row = mysqli_fetch_array($sql))
                            {
                        ?>
                        <tr>
                            <td><?php echo $row['username']; ?></td>
                            <td><?php echo $row['password']; ?></td>
                            <td><?php echo $row['tipo']; ?></td>
                            <td><?php echo $row['nombre']." ".$row['apellido_p']." ".$row['apellido_m']; ?> </td>
                            <td><?php echo $row['direccion']; ?></td>
                            <td><?php echo $row['telefono']; ?></td>
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
    <script src="js/agregar-usuario.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</html>