<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar ingredientes a platillos
        </title>

        <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/clean-install.css" rel="stylesheet">
    </head>
    <body>
        <?php
            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

            $query = "select max(clave) as pk from platillo";

            $sql = mysqli_query($connection, $query) or die("error en query");

            $row = mysqli_fetch_array($sql);

            $pk = $row['pk'];

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
                            <input name="qty" type="number" placeholder="Escriba la cantidad" class="form-control" required>
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
                <a href = "../menus/menu-install.html">
                <button class="btn btn-success">Continuar</button>
                </a>
            </div>
        </section>
    </body>
    <script src="../../js/vendor/validate-form.js"></script>
    <script src="../../js/forms/agregar-receta.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</html>
