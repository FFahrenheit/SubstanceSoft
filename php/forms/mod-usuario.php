<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">
        
        <title>
            Modificar usuario
        </title>

        <link href="../css/bs/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="container">
            <h1 class="text-uppercase text-center">Modificar usuario</h2>
            <p class="lead text-center">Por favor, llene los campos con la información requerida. Los campos marcados con <font color="red">*</font> son obligatorios.</p>
            <div class="row">
                <div class="col-8">
                    <form id="formulario" novalidate>
                        <?php
                            $user = $_GET['user'];
                            
                            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                            $query = "select * from usuario where username = '$user'";
                            

                            $sql = mysqli_query($connection, $query) or die("error");

                            $row = mysqli_fetch_array($sql);

                        ?>
                        <div class="form-group">
                            <label for="">Nombre de usuario: </label> <font color="red">*</font>
                            <input type="text" name="res" value="<?php echo $row['username']; ?>" class="form-control" required> 
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Contraseña: </label> <font color="red">*</font>
                            <input type="password" name="pas" value="" class="form-control" required> 
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>       
                        <div class="form-group">
                            <label for="">Confirmar contraseña: </label> <font color="red">*</font>
                            <input type="password" value="" class="form-control" required> 
                            <div class="invalid-feedback">
                                Ingresa datos
                              </div>
                        </div>                
                        <div class="form-group">
                            <label for="">Nombre:</label>
                            <input name="nom"type="text" value="<?php echo $row['nombre'];?>" class="form-control"> 
                        </div>                
                        <div class="form-group">
                                <label for="">Apellido paterno:</label>
                                <input name="pat" type="text" value="<?php echo $row['apellido_p'];?>" class="form-control"> 
                        </div>  
                        <div class="form-group">
                            <label for="">Apellido materno:</label>
                            <input name ="mat" type="text" value="<?php echo $row['apellido_m'];?>" class="form-control"> 
                        </div>                
                        <div class="form-group">
                            <label for="">Teléfono de contacto:</label>
                            <input name="tel" type="number" value="<?php echo $row['telefono'];?>"class="form-control"> 
                        </div>
                        <div class="form-group">
                            <label for="">Dirección:</label>
                            <input name="dir" type="text" value="<?php echo $row['direccion'];?>"class="form-control"> 
                        </div>
                        <div class="form-group">
                            <label for="">Tipo de usuario</label> <font color="red">*</font>
                            <select class="form-control" name="tip">
                                <option>administrador</option>
                                <option>empleado</option>
                            </select>
                        </div>
                        <div class="form-group">

                            <!--FALTA SCRIPT JS PARA MODIFICAR, no hay back end completo aún-->

                            <button type="submit" class="btn btn-danger">Continuar</button>
                        </div>
                    </form>
                </div>
            </div>    
        </section>
        <script>
                // Example starter JavaScript for disabling form submissions if there are invalid fields
                (function() {
                  'use strict';
                
                  window.addEventListener('load', function() {
                    var form = document.getElementById('formulario');
                    form.addEventListener('submit', function(event) {
                      if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                      }
                      form.classList.add('was-validated');
                    }, false);
                  }, false);
                })();
                </script>    
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</html>