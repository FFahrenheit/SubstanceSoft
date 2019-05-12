<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Administrar contraseñas
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet">
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;    
        }
    </script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a onclick="goBack(5);" style="float: left;">
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
        <h1 class="text-uppercase text-center">Administrar contraseñas</h2>
            <p class="lead text-center">Aquí puede ver y cambiar contraseñas</p>
            <div class="row">
                <div class="col-sm">
                    <?php
                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

                    $query = "SELECT username, AES_DECRYPT(password,'Sub5t4nc3S0Ft')
                    AS pass FROM usuario ORDER BY username ASC";

                    $sql = mysqli_query($connection, $query) or die("error en query");

                    ?>
                    <div class="containter-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Usuario</td>
                                    <td>Contraseña</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                        echo '<tr>';
                                        echo "<td>" . $row['username'] . "</td>";
                                        echo "<td>" . $row['pass'] . "</td>";
                                        echo '<td><a class ="btn btn-primary"
                                        style="color: white;"
                                         href="cambiar-pass.php?user=' . $row['username'] . '">
                                        Cambiar
                                        </a></td>';
                                        echo '</tr>';
                                }
                                ?>
                            </tbody>
                        </table>
                        <div class="text-center">
                            <button type="button" onclick="goBack()" class="btn btn-primary">Regresar</button>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/forms/functions/notificar-comanda.js"></script>
<script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>