<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>SubstanceSoft: Index</title>
  <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/simple-sidebar.css" rel="stylesheet">
</head>
<body>
    <?php
        session_start();
        $permisos = array(
            array( ""),
            array( "Asignar mesa", "Crear orden", "Cancelar","Liberar" ),
            array( "Recibir", "Consultar", "Notificar"),
            array("Consultar","Ticket","Cobro","Liberar"),
            array("Crear","Cancelar","Consultar","Ticket","Cobro")
          );
    ?>
  <div class="d-flex" id="wrapper">
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading"> SubstanceSoft </div>
      <div class="list-group list-group-flush">
        <!--Submenu-->
        <?php 
            if(isset($_GET['mod']))
            {
                $curMod = $_GET['mod'];
                $_SESSION['actual'] = $curMod;
            }
            else
            {
                $curMod = $_SESSION['actual'];
            }
            for($i = 0; $i < sizeof($permisos[$curMod]); $i++)
            {
                $path = "modulo".$curMod."-funcion".$i.".php";
        ?>
        <a href="../functions/<?php echo $path; ?>" class="list-group-item list-group-item-action bg-light"><?php echo $permisos[$curMod][$i]?></a>
        <?php
            }
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
                <?php
                for($i=0; $i<$_SESSION['functions'];$i++)
                { 
                ?>
                <?php
                    $desc = "function".$i;
                    $var = "valuefunction".$i;
                    $current = $_SESSION[$desc];
                    $val = $_SESSION[$var];
                ?>
                    <a class="navbar-brand" href="index.php?mod=<?php echo $val; ?>">
                    <?php echo $current;?>
                    </a>
                <?php
                } 
                ?>
              </nav>
        </div>
      </nav>
      <!--Body-->
      <div class="container-fluid">
        <div class="row">
          <div class="col-9 text-center">
              <?php 
                $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');

                $query = "SELECT descripcion FROM FUNCION WHERE CLAVE = $curMod"; 
            
                $result = mysqli_query($connection, $query) or die ('"query"');
            
                $row = mysqli_fetch_array($result); 
            
              ?>
              <h1 class="mt-4"><?php echo $row['descripcion'] ?></h1>
              <p> Bienvenido al sistema. Por favor, elija la función correspondiente a lo que desea hacer en el modulo.</p>
          </div>
          <div class="col-3">
            <div class="containter text-center">
              <img src="../../images/users.png" style="width: 50%;">
              <h3 class="mt4">
                <?php echo $_SESSION['name']; ?>
              </h3>
              <h4 class="mt4">
                <?php echo $_SESSION['username'];?>
              </h4>
              <p class="well">Message</p>
              <p class="border">Message</p>

              <a href="../menus/login.html">
                  <button type="button" class="align-self-end btn btn-danger" style="margin-top: auto;">Salir</button>
            </a>
                </div>
          </div>
        </div>
      </div>
      <!--Body-->
    </div>
  </div>
  <script src="../../js/vendor/jquery/jquery.min.js"></script>
  <script src="../../js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
  <script src="../../js/vendor/popper.min.js"></script>
  <script src="../../js/vendor/bootstrap.min.js"></script>
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>
</body>
</html>
