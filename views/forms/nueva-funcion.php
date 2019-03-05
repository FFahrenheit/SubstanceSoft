<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar funciones a usuarios
        </title>

        <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/clean-install.css" rel="stylesheet">
    </head>
    <body>
        <?php
            $user  = $_GET['user'];

            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

            $query = "select permisos.clave as pk, nombre, usuario.username as user, permiso, descripcion from permisos, usuario, funcion where 
            usuario.username = '$user' and usuario.username=permisos.username and funcion.clave = permisos.permiso";

            $sql = mysqli_query($connection, $query) or die("error en query");
        ?>
        <section class="container">
            <div class="text-center">
                <h1>Gestionar permisos a: <?php echo $user?></h1>
                &nbsp;
                <div class="row">
                    <div class="col-sm">
                        Permiso actuales:
                        <div class="containter-fluid">
                            <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Permiso</td>
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
                                    <td> <button class="btn btn-danger" value ="<?php echo $row['pk'] ?>">Eliminar</td>
                                </tr>
                                <?php
                                    }
                                ?>
                            </tbody>
                                </table>
                    </div>
                </div>
                    <div class="col-sm">
                        Agregar funciones:
                        <?php
                            $query = "select * from funcion where
                            clave not in(select permiso from permisos where username='$user') order by descripcion asc";

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
                                <option value="<?php echo $row['clave'];?>"> <?php echo $row['descripcion'];?> </option>
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
                <a href = "../menus/menu-install.html">
                <button class="btn btn-success">Continuar</button>
                </a>
            </div>
        </section>
    </body>
    <script src="../../js/vendor/validate-form.js"></script>
    <script src="../../js/forms/agregar-funcion.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
