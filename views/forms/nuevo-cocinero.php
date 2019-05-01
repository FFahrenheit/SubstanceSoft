<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar cocinas a chefs
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

<link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
<link href="../../css/clean-install.css" rel="stylesheet">
<script src="../../js/vendor/common-functions.js"></script>
<script>if (typeof module === 'object') {window.module = module;module = undefined;}</script></head>

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
        <?php
            $user  = $_GET['user'];

            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

            $query = "select chefs.clave as pk, cocina.nombre as descripcion from usuario, chefs, cocina where
            cocina.clave = chefs.cocina and usuario.username = '$user' and usuario.username = chefs.usuario";

            $sql = mysqli_query($connection, $query) or die("error en query");
        ?>
        <section class="container">
            <div class="text-center">
                <h1>Gestionar cocinas a: <?php echo $user?></h1>
                &nbsp;
                <div class="row">
                    <div class="col-sm">
                        Cocinas actuales:
                        <div class="containter-fluid">
                            <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Cocina</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                   while($row = mysqli_fetch_array($sql))
                                    {
                                    ?>
                                <tr>
                                    <td><?php echo $row['descripcion'];?></td>
                                    <td>
                                    <a style="color: white;"data-toggle="modal" data-target="#delete"
                                class="btn btn-danger" id="<?php echo $row['pk']?>" onClick="showDetails(this)">
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
                        Agregar cocinas:
                        <?php
                            $query = "select * from cocina where
                            clave not in(select cocina from chefs where usuario='$user') order by nombre asc";

                            $sql = mysqli_query($connection, $query) or die("error en query");
                        ?>
                        <form id="formulario" novalidate>
                        <div class="form-group">
                            <label for="">Función:  </label> <font color="red">*</font>
                            <select class="form-control" name="function">
                                <?php
                                    while($row = mysqli_fetch_array($sql))
                                    {
                                ?>
                                <option value="<?php echo $row['clave'];?>"> <?php echo $row['nombre'];?> </option>
                                <?php
                                    }
                                    mysqli_close($connection);
                                ?>
                            </select>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>

                        <input name="username" value="<?php echo $user;?>" type="hidden">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Agregar</button>
                        </div>
                    </form>
                    </div>
                </div>
                <a href = "../functions/modulo0-funcion0.php">
                <button class="btn btn-success">Continuar</button>
                </a>
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
                                ¿Seguro que desea eliminar la cocina asignada?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" onClick="confirmDelete()">Eliminar</button>
                            </div>
                            </div>
                        </div>
                    </div>
        </section>
    </body>
    <script src="../../js/forms/agregar-chef.js"></script>
    <script src="../../js/vendor/validate-form.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
    <script>if (window.module) module = window.module;</script>
</html>
