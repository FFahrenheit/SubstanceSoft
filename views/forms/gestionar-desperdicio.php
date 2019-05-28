<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Gestionar desperdicio
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
    <script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>    <script src="../../js/forms/gestionar-preferencia.js"></script>
</head>
  
<body class="s-bg">
    <div class="s-nb">
        <a href = "./../functions/modulo0-funcion3.php" style="float: left;">
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
        <h1 class="text-uppercase text-center">Razón de desperdicio</h1>
        <p>
            La razón de desperdicio toma en cuenta la posible falta de ingredientes en el inventario
            debido a al proceso humano. Puede especificar una razón de entre el 0% al 100% de lo que
            requiere un platillo al elaborarse.
        </p>
        <div class="row">
            <div class="container-fluid">
                <?php
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                $query = "SELECT valor FROM preferencias WHERE nombre='desperdicio_diario'";

                $result = mysqli_query($connection, $query) or die('"error al ejecutar"');

                $row = mysqli_fetch_array($result);

                if (!isset($row['valor']) || $row['valor'] == 0) {
                    echo '<h2>El desperdicio fijo está deshabilitado&nbsp;</h2>';
                    echo '<img height = "35%" src="../../images/advertencia.png" alt="Advertencia">';
                    echo '<h3>Presione el botón para habilitarlo&nbsp;</h3>';
                    echo '<button type="button" onclick = "setCodeStatus(true,'."'desperdicio_diario'".')" class="btn btn-success">Habilitar</button> ';
                    die();
                }

                $query = "SELECT valor FROM preferencias WHERE nombre='razon_desperdicio'";
                $result = mysqli_query($connection, $query);
                $row = mysqli_fetch_array($result);

                echo '<h3>La razón de desperdicio de ingrediente por platillo actual es de ' . $row['valor'] . '%</h3>';
                ?>
                <p>&nbsp;</p>
                <h4>Cambiar razón de desperdicio </h4>
                <div class="row justify-content-center">
                    <label for="">
                        Razón de desperdicio:
                        <font color="red">*</font>
                    </label>
                    <form id="formulario" class="form-horizontal form-inline" novalidate>
                        <div class="form-group" style="text-align:center;">
                            <div class="col-sm-8">
                                <input style="width:200px" placeholder="Ingrese la nueva razón de desperdicio" type="number" min="0" max="100" name="rate" id="rate" class="form-control" required>
                                <div class="invalid-feedback">
                                    Entrada inválida
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-success">Establecer</button>
                        </div>
                    </form>
                </div>
                <br></br><br></br>
                <button type="button" onclick="setCodeStatus(false,'desperdicio_diario')" class="btn btn-danger">Deshabilitar</button>
                <p>&nbsp;</p>
            </div>
        </div>
    </section>
</body>
<script src="../../js/vendor/validate-form.js"></script>
<script src="../../js/forms/desperdicio.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>
<script>if (window.module) module = window.module;</script>
</html>