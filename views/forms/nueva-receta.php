<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar ingredientes a platillos
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
        <?php
            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");
            
            if(isset($_GET['key']))
            {
                $pk = $_GET['key'];
            }
            else
            {
                $query = "select max(clave) as pk from platillo";
                $sql = mysqli_query($connection, $query) or die("error en query");
                $row = mysqli_fetch_array($sql);
                $pk = $row['pk'];
            }

            $query = "select nombre from platillo where clave=$pk";

            $sql = mysqli_query($connection, $query) or die("error en query");

            $row = mysqli_fetch_array($sql);

            $nombre = $row['nombre'];
        ?>
        <section class="container">
            <div class="text-center">
                <h1>Agregar ingredientes a: <?php echo $nombre?></h1>
                &nbsp;
                <div class="row">
                    <div class="col-sm">
                        Ingredientes agregados:
                        <div class="containter-fluid">
                            <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Ingrediente</td>
                                    <td>Cantidad</td>
                                    <td>Especificacion</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $query = "select recetas.cantidad as qty, ingrediente.nombre as name , ingrediente.especificacion as esp
                                    from ingrediente, recetas where ingrediente.clave = recetas.ingrediente and
                                    recetas.platillo = $pk group by name asc";

                                     $sql = mysqli_query($connection, $query) or die("error en query");

                                   while($row = mysqli_fetch_array($sql))
                                    {
                                    ?>
                                <tr>
                                    <td><?php echo $row['name'];?></td>
                                    <td><?php echo $row['qty'];?></td>
                                    <td><?php echo $row['esp'];?></td>
                                </tr>
                                <?php
                                    }
                                ?>
                            </tbody>
                                </table>
                    </div>
                </div>
                    <div class="col-sm">
                        Agregar ingrediente:
                        <?php
                            $query = "select nombre, clave, especificacion from ingrediente where
                            clave not in(select ingrediente from recetas where platillo=$pk) order by nombre asc";

                            $sql = mysqli_query($connection, $query) or die("error en query");
                        ?>
                        <form id="formulario" novalidate>
                        <div class="form-group">
                            <label for="">Ingrediente:  </label> <font color="red">*</font>
                            <select class="form-control" name="ing">
                                <?php
                                    while($row = mysqli_fetch_array($sql))
                                    {
                                ?>
                                <option value="<?php echo $row['clave'];?>"> <?php echo $row['nombre']." (".$row['especificacion'].")";?> </option>
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
                            <label for="">Cantidad:  </label> <font color="red">*</font>
                            <input name="qty" type="number" step="0.01" placeholder="Escriba la cantidad" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <input name="platillo" value="<?php echo $pk;?>" type="hidden">
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
        </section>
    </body>
    <script src="../../js/vendor/validate-form.js"></script>
    <script src="../../js/forms/agregar-receta.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
