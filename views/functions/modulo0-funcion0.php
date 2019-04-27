<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Administre la base de datos</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />
    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/simple-sidebar.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet"> <script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
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
                            <h1 class="text-uppercase text-center">Personalizar sistema</h2>
                                <div class="card-deck">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/users.png" alt="Usuarios">
                                            <div class="card-block">
                                                <h4 class="card-title">Usuarios</h4>
                                                <p class="card-text">Administre las credenciales con las que se usa el sistema</p>
                                                <p><a href="../forms/nuevo-usuario.html" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="../lists/listar-usuarios.php" class="btn btn-primary">Ver</a></p>
                                                <p><a href="../forms/modificar-usuario.php" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
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
                                                <p><a href="#" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/mesas.png" alt="Mesas">
                                            <div class="card-block">
                                                <h4 class="card-title">Mesas</h4>
                                                <p class="card-text">Administre las distintas mesas que hay en el sistema.</p>
                                                <p><a href="../forms/nueva-mesa.html" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="#" class="btn btn-primary">Ver</a></p>
                                                <p><a href="#" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p>&nbsp;</p>
                                <div class="card-deck">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/roles.png" alt="Roles">
                                            <div class="card-block">
                                                <h4 class="card-title">Roles</h4>
                                                <p class="card-text">Administre los roles de usuario</p>
                                                <p><a href="../forms/nuevo-permiso.php" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="#" class="btn btn-primary">Ver</a></p>
                                                <p><a href="../forms/nuevo-permiso.php" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/platillos.png" alt="Platillos">
                                            <div class="card-block">
                                                <h4 class="card-title">Platillos</h4>
                                                <p class="card-text">Administre los platillos en el sistema</p>
                                                <p><a href="../forms/nuevo-platillo.php" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="../lists/listar-platillos.php" class="btn btn-primary">Ver</a></p>
                                                <p><a href="#" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/proveedores.png" alt="Proveedores">
                                            <div class="card-block">
                                                <h4 class="card-title">Proveedores</h4>
                                                <p class="card-text">Administre el listado de proveedores en el sistema</p>
                                                <p><a href="../forms/nuevo-proveedor.html" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="../lists/listar-proveedores.php" class="btn btn-primary">Ver</a></p>
                                                <p><a href="#" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/surtidos.png" alt="Surtido fijo">
                                            <div class="card-block">
                                                <h4 class="card-title">Surtidos</h4>
                                                <p class="card-text">Administre los proveedores automáticos del sistema</p>
                                                <p><a href="../forms/nuevo-surtido.php" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="#" class="btn btn-primary">Ver</a></p>
                                                <p><a href="#" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p>&nbsp;</p>
                                <div class="card-deck">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/chef.png" alt="Chefs">
                                            <div class="card-block">
                                                <h4 class="card-title">Chefs</h4>
                                                <p class="card-text">Administre las cocinas de los chefs</p>
                                                <p><a href="../forms/nuevo-chef.php" class="btn btn-primary">Agregar</a></p>
                                                <p><a href="#" class="btn btn-primary">Ver</a></p>
                                                <p><a href="../forms/nuevo-chef.php" class="btn btn-primary">Modificar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/code.png" alt="Codigos">
                                            <div class="card-block">
                                                <h4 class="card-title">Codigos</h4>
                                                <p class="card-text">Administre el inicio de sesión mediante codigos</p>
                                                <p><a href="../forms/gestionar-codigos.php" class="btn btn-primary">Administrar</a></p>
                                                <p><a href="../lists/listar-codigos.php" class="btn btn-primary">Ver</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <img class="card-img-top img-fluid" src="../../images/receta.png" alt="Recetas">
                                            <div class="card-block">
                                                <h4 class="card-title">Recetas</h4>
                                                <p class="card-text">Administre los ingredientes involucrados en los platillos</p>
                                                <p><a href="../forms/gestionar-recetas.php" class="btn btn-primary">Administrar</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card text-center" style="visibility: hidden">
                                        <div class="card-body"></div>
                                    </div>
                                </div>
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
<script>if (window.module) module = window.module;</script>
</body>

</html>