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
        <h1 class="text-uppercase text-center">Exportar información</h2>
          <br>
          <br>
            <p class="lead text-center">Aquí puede exportar su base de datos para tener un respaldo</p>
            <p class="lead text-center">o usar el archivo para trasnsferir sus datos a otro sistema</p>
            <br>
            <br>
            <div class="text-center">
              <a style="color: white;" data-toggle="modal" data-target="#export" class="btn btn-success btn-lg">
                  Exportar
              </a>
            </div>
            <br>
            <br>
            <br>
            <div class="text-center">
                            <button type="button" onclick="goBack()" class="btn btn-primary">Regresar</button>
            </div>
            <div class="modal fade" id="export" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Exportar base de datos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ¿Exportar la base de datos?
                            <br>
                            (El sistema seguirá manteniendo su información actual)
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success" onClick="confirmExport()">Exportar</button>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</body>
<script src="../../../js/forms/functions/export-import.js"></script>
<script src="../../../js/vendor/common-functions.js"></script>
<script src="../../../js/forms/functions/notificar-comanda.js"></script>
<script src="../../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../../js/vendor/popper.min.js"></script>
<script src="../../../js/vendor/bootstrap.min.js"></script>
<script>
    if (window.module) module = window.module;
</script>

</html>
