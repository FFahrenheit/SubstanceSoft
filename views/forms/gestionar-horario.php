<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>
        Gestionar horario de encendido / apagado
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link rel="stylesheet" type="text/css" href="../../js/vendor/clock/dist/jquery-clockpicker.min.css">
    <script type="text/javascript" src="../../js/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/vendor/clock/dist/jquery-clockpicker.min.js"></script>
    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/forms/gestionar-horario.js"></script>
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
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Horario de habilitación</h1>
        <p>
            Aqui puede gestionar los horarios de habilitación del sistema para empleados. <br>
            Seleccione un horario en que el sistema se habilitará y otro para
            el cual se deshabilitará. Los administradores podrán ingresar en cualquier horario.&nbsp;
        </p>

        <div class="row">
            <div class="container-fluid">

                <?php
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                $query = "SELECT valor FROM preferencias WHERE nombre='apagado_dinamico'";

                $result = mysqli_query($connection, $query) or die('"error al ejecutar"');

                $row = mysqli_fetch_array($result);

                if (!isset($row['valor']) || $row['valor'] == 0) {
                    echo '<h2>El horario dinámico está deshabilitado&nbsp;</h2>';
                    echo '<img height = "35%" src="../../images/advertencia.png" alt="Advertencia">';
                    echo '<h3>Presione el botón para habilitarlo&nbsp;</h3>';
                    echo '<button type="button" onclick = "setCodeStatus(true)" class="btn btn-success">Habilitar</button> ';
                    mysqli_close($connection);
                    die();
                }
                ?>
                <div class="row">
                    <div class="col-sm">
                        <h2>Horarios actuales</h2>
                        <table class="table table-hover" style="margin: auto">
                            <thead>
                                <tr>
                                    <td>Funcion</td>
                                    <td>Apagado</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $i=0;
                                $query = "SELECT TIME(valor) as t,nombre FROM fechas WHERE nombre='encendido' OR nombre='apagado'";
                                $result = mysqli_query($connection, $query);
                                while ($row = mysqli_fetch_array($result)) {
                                    echo '<tr>';
                                    $var[$i] = $row['t'];
                                    echo "<td>" . $row['nombre'] . "</td>";
                                    echo "<td>" . $row['t'] . "</td>";
                                    echo '</td>';
                                    $i++;
                                }
                                mysqli_close($connection);
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm">
                        <h2>Especificar nuevo horario</h2>
                        <form id="formulario" novalidate>
                            <div class="form-group">
                                <label for="">Encendido</label>
                                <font color="red">*</font>
                                <input name="encendido" id="encendido" value="<?php echo $var[0]; ?>" class="form-control" required>
                                <div class="invalid-feedback">
                                    Ingresa datos
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">Apagado</label>
                                <font color="red">*</font>
                                <input name="apagado" id="apagado" value="<?php echo $var[1]; ?>" class="form-control" required>
                                <div class="invalid-feedback">
                                    Ingresa datos
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success">Establecer</button>
                            </div>
                        </form>
                    </div>
                </div>
                <button type="button" onclick="setCodeStatus(false)" class="btn btn-danger">Deshabilitar</button>
                <p>&nbsp;</p>
            </div>
        </div>
    </section>
</body>
<script src="../../js/vendor/validate-form.js"></script>
<script src="../../js/forms/cambiar-horario.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>

</html>