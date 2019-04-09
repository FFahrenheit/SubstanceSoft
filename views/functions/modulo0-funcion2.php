<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>SubstanceSoft: Index</title>
  <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/simple-sidebar.css" rel="stylesheet">
  <link href="../../css/index.css" rel="stylesheet">
</head>
<body>
    <?php
        include ($_SERVER['DOCUMENT_ROOT'].'/substancesoft/php/common/index-functions.php');
        getLogStatus();
        include ($_SERVER['DOCUMENT_ROOT'].'/substancesoft/php/functions/chef.php'); //Cambiar a admin.
    ?>
  <div class="d-flex" id="wrapper">
    <div class="bg-light border-right" id="sidebar-wrapper">
      <a href="../menus/index.php" class="hide"><div class="sidebar-heading"> SubstanceSoft </div></a>
      <div class="list-group list-group-flush">
        <!--Submenu-->
        <?php 
          echo getSideBar();
        ?>
        <!--Submenu-->
      </div>
    </div>
    <div id="page-content-wrapper">
      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">&#9668;</button>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <?php echo getNavBar();?>
            </nav>
        </div>
      </nav>
      <div class="container-fluid">
        <div class="row">
            <div class="col-9 text-center">
            <!-- BODY -->
            <h1 class="mt-4">Inventario</h1>
              <p> Aquí puede consultar el inventario.</p>
              <?php echo getInventory();?>
                <p> &nbsp;</p>
            </div>
            <!-- /BODY -->
            <div class="col-3">
                <div class="containter text-center">
                    <img src="../../images/users.png" style="width: 50%; margin-top: 20px;">
                    <h3 class="mt4">
                    <?php echo $_SESSION['name']; ?>
                    </h3>
                    <h4 class="mt4">
                    <?php echo $_SESSION['username'];?>
                    </h4>
                    <p class="well">Message</p>
                    <p class="border">Message</p>
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
  <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
  <script src="../../js/vendor/popper.min.js"></script>
  <script src="../../js/vendor/bootstrap.min.js"></script>
  <script src="../../js/vendor/common-functions.js"></script>
</body>
</html>