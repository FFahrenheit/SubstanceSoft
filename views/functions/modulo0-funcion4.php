<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Opciones extras</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />
    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/simple-sidebar.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <script>
        if (typeof module === 'object') {
            window.module = module;
            module = undefined;
        }
    </script>
</head>

<body>
    <?php
    include($_SERVER['DOCUMENT_ROOT'] . '/substancesoft/php/common/index-functions.php');
    getLogStatus();
    include($_SERVER['DOCUMENT_ROOT'] . '/substancesoft/php/functions/admin.php');
    ?>
    <div class="d-flex" id="wrapper">
        <div class="ss-sb border-right" id="sidebar-wrapper">
            <a href="../menus/index.php" class="hide nochange">
                <div align="center" class="sidebar-heading nochange">
                    <i>SubstanceSoft</i>
                </div>
            </a>
            <div class="list-group list-group-flush">
                <!--Submenu-->
                <?php
                echo getSideBar();
                ?>
                <!--Submenu-->
            </div>
        </div>
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg ss-nb border-bottom">
                <button class="btn btn-light" id="menu-toggle">
                    <img src="../../images/collapse.png">
                </button>
                <button class="btn btn-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <img src="../../images/collapse2.png">
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <nav class="navbar navbar-expand-lg">
                        <?php echo getNavBar(); ?>
                    </nav>
                </div>
            </nav>
            <div class="container-fluid ss-bg">
                <div class="row">
                    <div class="col-9 text-center">
                        <!-- BODY -->
                        <section class="container">
                            <p>&nbsp;</p>
                            <h1 class="text-uppercase text-center">Opciones extra</h2>
                                <div class="card-deck">
                                        <div class="card text-center">
                                        <a href="./forms/confirmar-usuario.php?ref=pass" class="a-card">
                                            <div class="card-body">
                                                <img class="card-img-top img-fluid" src="../../images/password.png" alt="Contraseñas">
                                                <div class="card-block">
                                                    <h4 class="card-title">Contraseñas</h4>
                                                    <p class="card-text">Consulte y cambie las contraseñas de sus usuarios</p>
                                                    <strong>Requiere confirmación de administrador</strong>
                                                    <p class="btn btn-primary">Administrar</p>
                                                </div>
                                            </div>
                                            </a>

                                        </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/cocinas.png" alt="Cocinas">
                                            <div class="card-block">
                                                <h4 class="card-title">Cocinas</h4>
                                                <p class="card-text">Administre las múlltiples zonas de cocina en el sistema</p>
                                                <p><a href="../forms/nueva-cocina.html" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="../lists/listar-cocinas.php" class="btn btn-primary">Ver</a></p>
                                                <p><a href="../forms/modificar-cocina.php" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/ingredientes.png" alt="Ingredientes">
                                            <div class="card-block">
                                                <h4 class="card-title">Ingredientes</h4>
                                                <p class="card-text">Administre los distintos ingredientes usados en el sistema</p>
                                                <p><a href="../forms/nuevo-ingrediente.html" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="../lists/listar-ingredientes.php" class="btn btn-primary">Ver</a></p>
                                                <p><a href="../forms/modificar-ingredientes.php" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p>&nbsp;</p>
                        </section>
                    </div>
                    <!-- /BODY -->
                    <div class="col-3">
                        <div class="containter text-center">
                            <img src="../../images/users.png" style="width: 50%; margin-top: 20px;">
                            <?php echo getUserStatus(); ?>
                            <a href="../../php/requests/logout.php">
                                <button type="button" class="align-self-end btn btn-danger" style="margin-top: auto;">
                                    Salir
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../js/vendor/jquery/jquery.min.js"></script>
    <script src="../../js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../js/vendor/popper.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
    <script src="../../js/vendor/common-functions.js"></script>
    <script>
        if (window.module) module = window.module;
    </script>
</body>

</html>