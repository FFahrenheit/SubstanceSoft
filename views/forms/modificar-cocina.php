<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Mostrar cocinas
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
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
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
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

                        $rows = $sql->num_rows;
                        while ($row = mysqli_fetch_array($sql)) {
                            ?>
                            <tr>
                                <td><?php echo $row['nombre']; ?></td>
                                <td> <a href="modificar-cocina-form.php?nombre=<?php echo $row['nombre'] ?>" class="btn btn-primary">Modificar</a> </td>
                                <?php
                                if ($rows > 1) {
                                    echo '                            <td>
                                <a style="color: white;"data-toggle="modal" data-target="#delete"
                                class="btn btn-danger" id="' . $row['nombre'] . '" onClick="showDetails(this)">
                                    Eliminar o migrar
                                </a>
                            </td>';
                                }
                                ?>
                            </tr>
                        <?php
                    }
                    ?>
                    </tbody>
                </table>
                <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Eliminar cocina</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Qué desea hacer con la cocina en cuestión?
                                <br>
                                Puede elegir borrar los platillos también o migrarlos de cocina
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary" onClick="confirmMigrate()">Migrar</button>
                                <button type="button" class="btn btn-danger" onClick="confirmDelete()">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Migrar cocina</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Seleccione la cocina a migrar
                                <br>
                                <select id="migrar">
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onClick="confirmMigrateManually()">Migrar manualmente</button>
                                <button type="button" class="btn btn-secondary" onClick="cancelAll()">Cancelar</button>
                                <button type="button" class="btn btn-success" onClick="confirmMigrateAll()">Migrar todos</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script src="../../js/vendor/jquery-3.1.1.min.js"></script>
<script src="../../js/forms/eliminar-cocina.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>