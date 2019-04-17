<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Agregar nuevo platillo
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../../images/icono.png" />

    <link href="../../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/clean-install.css" rel="stylesheet">
</head>

<body class="s-bg">
    <div class = "s-nb"> 
        <a onclick = "goBack()">
            <img src="img/logo.png" alt="&iexcl;Bienvenido a void loop!">
            <h1>Atrás</h1>
        </a>
        <ul>
            <li><a href="inicio.html#header">Inicio</a></li>
            <li><a href="placas.html#header">Placas</a></li>
            <li><a href="software.html#header">Software</a></li>
            <li><a href="proyectos.html#header">Proyectos</a></li>
        </ul>
    </div>
    <section class="container">
        <h1 class="text-uppercase text-center">Nueva orden</h2>
            <p class="lead text-center">Por favor, llene los campos con la información requerida. Los campos marcados con <font color="red">*</font> son obligatorios.</p>
            <div class="row">
                <div class="col-8">
                    <form id="formulario" novalidate>
                        <div class="form-group">
                            <label for="">Mesa asginada: </label>
                            <font color="red">*</font>
                            <?php
                            $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

                            $query = "select * from mesa where numero not in (select mesa from orden where estado
                                ='abierta') and numero!=0";

                            $sql = mysqli_query($connection, $query) or die("error en query");

                            if ($sql->num_rows == 0) {
                                    echo "No hay mesas disponibles en sistema. Se usará una alterna";
                                }
                            ?>
                            <select class="form-control" name="mesa">
                                <?php
                                while ($row = mysqli_fetch_array($sql)) {
                                        ?>
                                    <option><?php echo $row['numero']; ?></option>
                                <?php
                            }
                        mysqli_close($connection);
                        ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Breve descripción: </label>
                            <input name="desc" type="text" placeholder="Escriba una descripción para la orden" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                Agregar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
    </section>
</body>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/vendor/validate-form.js"></script>
<script src="../../../js/forms/functions/nueva-orden.js"></script>
<script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>

</html>