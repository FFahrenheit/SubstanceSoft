<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, inicial-scale=1">

        <title>
            Horarios populares
        </title>

        <?php include ($_SERVER['DOCUMENT_ROOT'].'/substancesoft/php/charts.php');?>

        <link href="../css/bs/bootstrap.min.css" rel="stylesheet">
        <link href="../css/clean-install.css" rel="stylesheet">
        <script src="../js/vendor/Chart.js/Chart.min.css"></script>
        <script src="../js/vendor/Chart.js/Chart.js"></script>
        <script src="../js/vendor/Chart.js/samples/utils.js"></script>
        <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
        </style>
    </head>
    <body>
        <section class="container">
            <div align="center">
                <h1 class="text-uppercase text-center">Horarios de ventas</h2>
                <p class="lead text-center">A continuación se muestran las datos de los horarios de ventas más populares de la última semana</p>
                <div id="container" style="width: 75%;">
                        <canvas id="canvas"></canvas>
                </div>
                <a href = "../modulo0-funcion1.php">
                    <button class="btn btn-success">Regresar</button>
                </a>
            </div>
        </section>
    </body>
    <script>
            var color = Chart.helpers.color;
            var horizontalBarChartData = {
                labels: [<?php echo getSalesPerHourTitles(); ?>],
                datasets: [{
                    label: 'Ventas por horario',
                    backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                    borderColor: window.chartColors.red,
                    borderWidth: 1,
                    data: [
                       <?php echo getSalesPerHourData(); ?> 
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
                            text: 'Ventas por horario'
                        }
                    }
                });
    
            };
        </script>
    <script src="../js/vendor/validate-form.js"></script>
    <script src="../js/forms/functions/nueva-orden.js"></script>
    <script src="../js/vendor/jquery-3.3.1.slim.min.js"></script>
    <script src="../js/vendor/popper.min.js"></script>
    <script src="../js/vendor/bootstrap.min.js"></script>
</html>