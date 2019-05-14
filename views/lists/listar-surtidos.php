<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Mostrar surtidos
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
<script>if (window.module) module = window.module;</script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack()"   style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()"   style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container text-center">
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Listado de surtidos por proveedor</h1>
        <div class="row">
            <div class="container-fluid">
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Proveedor</td>
                            <td>Ingrediente</td>
                            <td>Cantidad</td>
                            <td>Frecuencia</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                        $query = "select * from surtidos GROUP BY proveedor";

                        $sql = mysqli_query($connection, $query) or die("error");

                        while ($row = mysqli_fetch_array($sql)) {
                          $key = $row['proveedor'];
                          $statement = "SELECT surtidos.clave AS pk, ingrediente.nombre AS ingrediente, surtidos.cantidad AS
                          cantidad, surtidos.frecuencia AS frecuencia FROM surtidos, ingrediente WHERE
                          surtidos.ingrediente = ingrediente.clave AND surtidos.proveedor = $key";
                          $state = mysqli_query($connection, $statement);
                          ?>
                            <tr>
                              <?php
                                $proveedor = mysqli_query($connection, "SELECT nombre FROM proveedor WHERE clave = $key") or die ("error");
                                $nombre = mysqli_fetch_array($proveedor);
                                ?>
                                <td><?php echo $nombre['nombre']; ?></td>
                                <td>
                                <?php
                                  while($rows = mysqli_fetch_array($state))
                                  {
                                    echo $rows['ingrediente'];
                                    ?><br><?php
                                  }
                                  ?></td>
                                  <td>
                                  <?php
                                  $state = mysqli_query($connection, $statement);
                                    while($rows = mysqli_fetch_array($state))
                                    {
                                      echo $rows['cantidad'];
                                      ?><br><?php
                                    }
                                    ?></td>
                                    <td>
                                    <?php
                                    $state = mysqli_query($connection, $statement);
                                      while($rows = mysqli_fetch_array($state))
                                      {
                                        echo $rows['frecuencia'];
                                        echo " días";
                                        ?><br><?php
                                      }
                                      ?></td>
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
<script src="../../js/vendor/common-functions.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>

</html>
