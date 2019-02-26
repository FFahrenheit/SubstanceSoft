<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Modificar usuario
        </title>

        <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="container text-center">
            <?php
                $user = $_GET['user'];
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                $query = "select * from usuario where username = '$user'";
                $sql = mysqli_query($connection, $query) or die("error");
                $row = mysqli_fetch_array($sql);
            ?>
            <h1>Modificando a <?php printRow($row,'username'); ?></h1>
            <p>&nbsp;</p>
            <div class="row">
                <div class="col -8">
                <form id="formulario" novalidate>
                    <div class="form-group">
                        <label for="">Nombre de usuario</label> <font color="red">*</font>
                        <input name="usu" type="text" value="<?php printRow($row,'username'); ?>"" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Contraseña: </label> <font color="red">*</font>
                        <input type="password" name="pas" value="<?php printRow($row, 'password');?>" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Confirmar contraseña: </label> <font color="red">*</font>
                        <input type="password" placeholder="Repita la contraseña" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                            </div>
                    </div>
                    <div class="form-group">
                        <label for="">Nombre del usuario: </label>
                        <input name="nom" type="text" value="<?php printRow($row, 'nombre'); ?>" class="form-control">
                    </div>
                    <div class="form-group">
                            <label for="">Apellido paterno del usuario: </label>
                            <input name="pat" type="text" value="<?php  printRow($row,'apellido_p');?>" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">Apellido materno del usuario</label>
                        <input name ="mat" type="text" value="<?php printRow($row,'apellido_m');?>" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">Teléfono de contacto</label>
                        <input name="tel" type="number"  value="<?php printRow($row,'telefono'); ?>" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">Dirección:</label>
                        <input name="dir" type="text" value="<?php printRow($row,'username'); ?>" class="form-control">
                    </div>
                    <div class="form-group">
                        <button type="submit"  class="btn btn-danger">Modificar</button>
                    </div>
                    <input name="old" value="<?php echo $row['username'];?>" type="hidden">
                </form>
                <?php
                    mysqli_close($connection);
                    function printRow($col, $field)
                    {
                        if(isset($col[$field]))
                        {
                            echo $col[$field];
                        }
                        else
                        {
                            echo " ";
                        }
                    }
                ?>
            </div>
        </section>
    </body>
    <script src="../../js/vendor/validate-form.js"></script> 
    <script src="../../js/forms/modificar-usuario.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</html>
