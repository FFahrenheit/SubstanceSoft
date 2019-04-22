<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Consultar inventario</title>
  <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />
  <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/simple-sidebar.css" rel="stylesheet">
  <link href="../../css/index.css" rel="stylesheet">
</head>

<body>
  <?php
  include($_SERVER['DOCUMENT_ROOT'] . '/substancesoft/php/common/index-functions.php');
  getLogStatus();
  include($_SERVER['DOCUMENT_ROOT'] . '/substancesoft/php/functions/admin.php'); //Cambiar a admin.
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
          <div class="col-9 text-center" align="center">
            <!-- BODY -->
            <h1 class="mt-4">Inventario</h1>
            <p> Aquí puede consultar el inventario.</p>
            <form class="form-horizontal form-inline justify-content-center">
              <div class="form-group">
                <label class="control-label col-sm-2" for="busqueda">Busqueda:</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" name="search" id="search" placeholder="Escriba su busqueda">
                </div>
              </div>
            </form>
            <p> &nbsp;</p>
            <div id="tabla">
              <!-- Tabla autogenerada -->
            </div>
            <p> &nbsp;</p>
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
  <script src="../../js/vendor/jquery-3.1.1.min.js"></script>
  <script src="../../js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../../js/vendor/popper.min.js"></script>
  <script src="../../js/vendor/bootstrap.min.js"></script>
  <script src="../../js/vendor/common-functions.js"></script>
  <script src="../../js/forms/functions/inventario.js"></script>
</body>

</html>