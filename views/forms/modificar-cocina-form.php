<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Modificar cocina
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

<link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
<link href="../../css/clean-install.css" rel="stylesheet">
<script src="../../js/vendor/common-functions.js"></script>
</head>

<body class="s-bg">
<div class="s-nb">
    <a onclick="goBack()" href="#inicio" style="float: left;">
        <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
    </a>
    <a href="../../views/menus/index.php">
        <h1>SubstanceSoft</h1>
    </a>
    <a onclick="refreshPage()" href="#inicio" style="float: left;">
        <img src="../../images/reload.png" alt="Recargar">
    </a>
</div>
        <section class="container text-center">
            <?php
                $nombre = $_GET['nombre'];
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                $query = "select * from cocina where nombre = '$nombre'";
                $sql = mysqli_query($connection, $query) or die("error");
                $row = mysqli_fetch_array($sql);
            ?>
            <h1>Modificando a <?php printRow($row,'nombre'); ?></h1>
            <p>&nbsp;</p>
            <div class="row">
                <div class="col -8">
                <form id="formulario" novalidate>
                    <div class="form-group">
                        <label for="">Nombre de cocina</label> <font color="red">*</font>
                        <input name="nombre" type="text" value="<?php printRow($row,'nombre'); ?>"" class="form-control" required>
                        <div class="invalid-feedback">
                            Ingresa datos
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit"  class="btn btn-danger">Modificar</button>
                    </div>
                    <input name="old" value="<?php echo $row['nombre'];?>" type="hidden">
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
    <script src="../../js/forms/modificar-cocina.js"></script>
    <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
</html>
