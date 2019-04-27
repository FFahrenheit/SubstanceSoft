<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Demanda de platillos
        </title>
        <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

        <?php include ($_SERVER['DOCUMENT_ROOT'].'/substancesoft/php/charts.php');?>

        <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../../../css/clean-install.css" rel="stylesheet"><script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
        <script src="../../../js/vendor/Chart.js/Chart.min.css"></script>
        <script src="../../../js/vendor/Chart.js/Chart.js"></script>
        <script src="../../../js/vendor/Chart.js/samples/utils.js"></script>
        <style>
        canvas 
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
        </style>
    </head>
    <body class="s-bg">
            <div class = "s-nb"> 
                    <a onclick = "goBack()"   style="float: left;">
                            <img src="../../../images/back.png" style = "width: 50px;"alt="Regresar">
                    </a>
                    <a href="../../../views/menus/index.php"><h1>SubstanceSoft</h1></a>
                    <a onclick = "refreshPage()"   style="float: left;">
                            <img src="../../../images/reload.png" alt="Recargar">
                    </a>
                </div>        <section class="container">
            <div align="center">
                <h1 class="text-uppercase text-center">Cortes de la semana</h2>
                <p class="lead text-center">A continuación se muestran el total ganado de la semana pasada por día</p>
                <div id="container" style="width: 75%;">
                        <canvas id="canvas"></canvas>
                </div>
                    <button onclick="goBack()" class="btn btn-success">Regresar</button>
            </div>
        </section>
    </body>
    <script>
            var color = Chart.helpers.color;
            var horizontalBarChartData = {
                labels: [<?php echo getDailyEarningTitles(); ?>],
                datasets: [{
                    label: 'Venta diaria',
                    backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                    borderColor: window.chartColors.red,
                    borderWidth: 1,
                    data: [
                       <?php echo getDailyEarningData(); ?> 
                    ]
                }]
    
            };
    
            window.onload = function() {
                var ctx = document.getElementById('canvas').getContext('2d');
                window.myHorizontalBar = new Chart(ctx, {
                    type: 'horizontalBar',
                    data: horizontalBarChartData,
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
                            text: 'Cortes de la semana'
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
<script>if (window.module) module = window.module;</script>
</html>