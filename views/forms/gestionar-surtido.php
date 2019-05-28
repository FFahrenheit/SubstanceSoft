<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Gestionar surtidores fijos
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
        <a href="./modificar-proveedores.php" style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <?php
    $key  = $_GET['key'];
    $nombre = $_GET['name'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

    $query = "SELECT ingrediente AS ing, surtidos.clave AS pk, ingrediente.nombre AS ingrediente, surtidos.cantidad AS
            cantidad, surtidos.frecuencia AS frecuencia FROM surtidos, ingrediente WHERE
            surtidos.ingrediente = ingrediente.clave AND surtidos.proveedor = $key ";


    $sql = mysqli_query($connection, $query) or die("error en query");

    ?>
    <section class="container">
        <div class="text-center">
            <h1>Gestionar surtidos a: <?php echo $nombre ?></h1>
            &nbsp;
            <div class="row">
                <div class="col-sm">
                    Surtidos actuales:
                    <div class="containter-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Ingrediente</td>
                                    <td>Cantidad</td>
                                    <td>Frecuencia (días) </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['ingrediente']; ?></td>
                                        <td><?php echo $row['cantidad']; ?></td>
                                        <td><?php echo $row['frecuencia']; ?></td>
                                        <td>
                                            <a style="color: white;" data-toggle="modal" data-target="#modify" class="btn btn-primary" id="<?php echo $row['pk'] ?>" onClick="showDetailsModify(this)" data-qty="<?php echo $row['cantidad']; ?>" data-frc=<?php echo $row['frecuencia']; ?> data-ing=<?php echo $row['ing'] ?>>
                                                Modificar
                                            </a></td>
                                        <td>
                                            <a style="color: white;" data-toggle="modal" data-target="#delete" class="btn btn-danger" id="<?php echo $row['pk'] ?>" onClick="showDetails(this)">
                                                Eliminar
                                            </a></td>
                                    </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm">
                    Agregar surtido:
                    <?php
                    $query = "select * from ingrediente where
                            clave not in(select ingrediente from surtidos where proveedor=$key) order by nombre asc";

                    $sql = mysqli_query($connection, $query) or die("error en query");
                    ?>
                    <form id="formulario" novalidate>
                        <div class="form-group">
                            <label for="">Ingrediente: </label>
                            <font color="red">*</font>
                            <select class="form-control" name="ing" required>
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <option value="<?php echo $row['clave']; ?>"> <?php echo $row['nombre'] . "(" . $row['especificacion'] . ")"; ?> </option>
                                <?php
                            }
                            mysqli_close($connection);
                            ?>
                            </select>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Cantidad a agregar: </label>
                            <font color="red">*</font>
                            <input name="qty" type="number" step="0.01" placeholder="Escriba la cantidad del ingrediente que se agregará" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Frecuencia (días): </label>
                            <font color="red">*</font>
                            <input name="frec" type="number" placeholder="Escriba la frecuencia del surtido fijo" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <input name="proveedor" value="<?php echo $key; ?>" type="hidden">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
            <a href="../menus/index.php">
                <button class="btn btn-success">Volver a inicio</button>
            </a>
        </div>
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Eliminar surtido fijo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ¿Seguro que desea eliminar el surtido fijo?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" onClick="confirmDelete()">Eliminar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modify" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modificar surtido fijo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="">Cantidad a agregar: </label>
                            <font color="red">*</font>
                            <input id="modqty" name="qty" type="number" step="0.01" placeholder="Escriba la cantidad del ingrediente que se agregará" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Frecuencia (días): </label>
                            <font color="red">*</font>
                            <input id="modfrc" name="frec" type="number" placeholder="Escriba la frecuencia del surtido fijo" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onClick="confirmModify()">Modificar</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script src="../../js/forms/agregar-surtido.js"></script>
<script src="../../js/vendor/validate-form.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>