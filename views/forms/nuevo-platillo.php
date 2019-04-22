<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Agregar nuevo platillo
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

<link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
<link href="../../css/clean-install.css" rel="stylesheet">
<script src="../../js/vendor/common-functions.js"></script>
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
        <section class="container">
            <h1 class="text-uppercase text-center">Agregar platillo</h2>
            <p class="lead text-center">Por favor, llene los campos con la información requerida. Los campos marcados con <font color="red">*</font> son obligatorios.</p>
            <div class="row">
                <div class="col-8">
                    <form id="formulario" novalidate>
                        <div class="form-group">
                            <label for="">Nombre del platillo:  </label> <font color="red">*</font>
                            <input name="name" type="text" placeholder="Escriba el nombre del platillo" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Precio: </label> <font color="red">*</font>
                            <input type="number" step="0.01" name="price" placeholder="Escriba el precio del platillo" class="form-control" required>
                            <div class="invalid-feedback">
                                Ingresa datos
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Cocina</label> <font color="red">*</font>
                            <?php
                                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die ("error en BD");

                                $query = "select * from cocina";

                                $sql = mysqli_query($connection, $query) or die("error en query");
                            ?>
                            <select class="form-control" name="kitchen">
                                <?php
                                while($row = mysqli_fetch_array($sql))
                                {
                                ?>
                                <option><?php echo $row['nombre'];?></option>
                                <?php
                                }
                                    mysqli_close($connection);
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Descripcion</label>
                            <input name="description"type="text" placeholder="Describa el platillo" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="">Categoria</label> <font color="red">*</font>
                            <select class="form-control" name="cat">
                                <option>Bebidas</option>
                                <option>Guisados</option>
                                <option>Postres</option>
                                <option>Rapida</option>
                                <option>Sopas</option>
                                <option>Otros</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Dificultad</label> <font color="red">*</font>
                            <select class="form-control" name="dif">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                Continuar a enlistar ingredientes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
    <script src="../../js/vendor/validate-form.js"></script>
    <script src="../../js/forms/agregar-platillo.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
