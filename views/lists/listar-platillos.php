<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Mostrar platillos
        </title>

        <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="container text-center">
        <p>&nbsp;</p>
            <h1 class="text-uppercase text-center">Listado de platillos</h1>
            <div class="row">
                <div class="container-fluid">
                    <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre</td>
                            <td>Precio</td>
                            <td>Dificultad</td>
                            <td>Descripci&oacute;n</td>
                            <td>Cocina</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                            $query = "select * from platillo";
                            $sql = mysqli_query($connection, $query) or die("error");

                            while($row = mysqli_fetch_array($sql))
                            {
                              $coc = $row['cocina'];
                              $cocina = "select * from cocina where clave = '$coc'";
                              $sql_c = mysqli_query($connection, $cocina) or die("error");
                              $row_c = mysqli_fetch_array($sql_c);?>
                              <tr>
                                  <td><?php echo $row['nombre']; ?></td>
                                  <td><?php echo $row['precio']; ?></td>
                                  <td><?php echo $row['dificultad']; ?></td>
                                  <td><?php echo $row['descripcion']; ?></td>
                                  <td><?php echo $row_c['nombre'];?></td>
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
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
