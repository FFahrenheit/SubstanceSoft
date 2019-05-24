<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Migrar platillos manualmente
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet">
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack()" style="float: left;">
            <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <?php
    $clave  = $_GET['cocina'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");
    mysqli_set_charset($connection, "utf8");

    $query = "SELECT * FROM platillo WHERE cocina = 
    (SELECT clave FROM cocina WHERE nombre = '$clave')";

    $result = mysqli_query($connection, $query) or die("error en la query");

    $rows = $result->num_rows;

    if($rows==0)
    {
        $query = "DELETE FROM cocina WHERE nombre='$clave'";

        $result = mysqli_query($connection, $query) or die("error en la query");

        header("Location: /substancesoft/views/functions/modulo0-funcion0.php");
    }

    ?>
    <section class="container">
        <div class="text-center">
            <h1>Migrar cocinas</h1>
            &nbsp;
            <h2>Platillos a migrar: <?php echo $rows; ?></h2>
            <div class="containter-fluid">
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre</td>
                            <td>Descripcion</td>
                            <td>Migrar</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        while ($row = mysqli_fetch_array($result)) {
                            echo '<tr>';
                            echo '<td>' . $row['nombre'] . '</td>';
                            echo '<td>' . $row['descripcion'] . '</td>';
                            echo '                            <td>
                                    <a style="color: white;"data-toggle="modal" data-target="#delete"
                                    class="btn btn-primary" id="' . $row['clave'] . '" onClick="showDetails(this,'."'".$clave."'".')">
                                        Elegir cocina
                                    </a>
                                    </td>';
                            echo '</tr>';
                        }
                        ?>
                    </tbody>
                </table>
                <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Elegir cocina</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Elegir cocina en cuestion
                                <br>
                                <select id="cocina">
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onClick="confirmMigrate()">Migrar</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <button class="btn btn-success" onclick="goBack()">Regresar</button>
        </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../../js/forms/actualizar-cocina.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>