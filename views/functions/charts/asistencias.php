<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Asistencia por usuario
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <?php
    include($_SERVER['DOCUMENT_ROOT'] . '/substancesoft/php/charts.php');
    $user = $_GET['user'];
    ?>

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet">
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>
    <script src="../../../js/vendor/Chart.js/Chart.min.css"></script>
    <script src="../../../js/vendor/Chart.js/Chart.js"></script>
    <script src="../../../js/vendor/Chart.js/samples/utils.js"></script>
    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack()" style="float: left;">
            <img src="../../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container">
        <div align="center">
            <h1 class="text-uppercase text-center">Asistencias por usuario</h2>
                <p class="lead text-center">A continuación puede consultar las entradas y salidas del usuario, además de una gráfica significativa</p>
                <div class="row">
                    <div class="col-sm">
                        <table class="table table-hover" style="margin: auto">

                            <thead>
                                <tr>
                                    <td>Día</td>
                                    <td>Entrada</td>
                                    <td>Salida</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php

                                $conn = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                                $query = "SELECT date(entrada) AS dia, time(entrada) as entrada, time(salida) as salida 
        FROM asistencia WHERE usuario = '$user' AND 
        entrada >= (SELECT valor from fechas where nombre='fecha_in') 
        AND entrada <= (SELECT valor from fechas where nombre='fecha_fin')";

                                $sql = mysqli_query($conn, $query) or die("error");

                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row['dia']; ?></td>
                                        <td><?php echo $row['entrada']; ?></td>
                                        <td><?php echo $row['salida']; ?> </td>
                                    </tr>
                                <?php
                            }
                            mysqli_close($conn);
                            ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm">

                        <div id="container" style="width: 75%;">
                            <canvas id="canvas"></canvas>
                        </div>
                    </div>
                </div>
                <button onclick="goBack()" class="btn btn-success">Regresar</button>
        </div>
    </section>
</body>
<script>
    var color = Chart.helpers.color;

    var config = {
        labels: [<?php echo getEntryTitle($user); ?>],
        datasets: [{
                label: 'Entrada',
                fill: false,
                borderColor: window.chartColors.blue,
                backgroundColor: window.chartColors.blue,
                data: [
                    <?php echo getEntryData($user); ?>
                ]
            },
            {
                label: 'Entrada',
                fill: false,
                borderColor: window.chartColors.red,
                backgroundColor: window.chartColors.red,
                data: [
                    <?php echo getExitData($user); ?>

                ]
            }
        ]
    };


    window.onload = function() {
        var ctx = document.getElementById('canvas').getContext('2d');
        window.myHorizontalBar = new Chart(ctx, {
            type: 'line',
            data: config,
            options: {
                scales: {
                    xAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    rectangle: {
                        borderWidth: 2,
                    }
                },
                responsive: true,
                legend: {
                    position: 'right',
                },
                title: {
                    display: true,
                    text: 'Asistencias'
                }
            }
        });

    };
</script>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/validate-form.js"></script>
<script src="../../../js/forms/functions/nueva-orden.js"></script>
<script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>