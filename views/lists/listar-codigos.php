<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Mostrar códigos de acceso
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script src="../../js/vendor/common-functions.js"></script>
    <script src="../../js/forms/generar-codigo.js"></script>

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
        <h1 class="text-uppercase text-center">Listado de códigos</h1>
        <div class="row">
            <div class="container-fluid">
                <?php 
                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

                    $query = "SELECT valor FROM preferencias WHERE nombre='acceso_codigo'";

                    $result = mysqli_query($connection, $query) or die ('"error al ejecutar"');

                    $row = mysqli_fetch_array($result); 
                    if(!isset($row['valor']) || $row['valor']==0)
                    {
                        echo '<h2>El acceso por código está deshabilitado&nbsp;</h2>';
                        echo '<h3>Presione el botón para habilitarlo&nbsp;</h3>';
                        echo '<button type="button" onclick = "setCodeStatus(true)" class="btn btn-success">Habilitar</button> ';
                        die();
                    }
                ?>
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre</td>
                            <td>Código</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $query = "select * from usuario";

                        $sql = mysqli_query($connection, $query) or die("error");

                        while ($row = mysqli_fetch_array($sql)) {
                                ?>
                            <tr>
                                <td><?php echo $row['username']; ?></td>
                                <td><?php echo $row['codigo']; ?></td>
                            </tr>
                        <?php
                    }

                mysqli_close($connection);
                ?>
                    </tbody>
                </table>
                <button type="button" onclick = "setCodeStatus(false)" class="btn btn-danger">Desabilitar</button>

            </div>
        </div>
    </section>
</body>
<script src="../../js/forms/generar-codigo.js"></script>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>

</html>