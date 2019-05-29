<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, inicial-scale=1">

    <title>
        Gestionar tarjetas
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="../../images/icono.png" />

    <link href="../../css/bs/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/clean-install.css" rel="stylesheet">
    <script>if (typeof module === 'object') {window.module = module;module = undefined;}</script>
    <script src="../../js/vendor/common-functions.js"></script>
    <script src="../../js/forms/asignar-tarjeta.js"></script>
    <script src="../../js/forms/gestionar-preferencia.js"></script>
</head>

<body class="s-bg">
    <div class="s-nb">
        <a href = "./../functions/modulo0-funcion3.php" style="float: left;">
            <img src="../../images/back.png" style="width: 50px;" alt="Regresar">
        </a>
        <a href="../../views/menus/index.php">
            <h1>SubstanceSoft</h1>
        </a>
        <a onclick="refreshPage()" style="float: left;">
            <img src="../../images/reload.png" alt="Recargar">
        </a>
    </div>
    <section class="container text-center">
        <p>&nbsp;</p>
        <h1 class="text-uppercase text-center">Listado de tarjetas</h1>
        <div class="row">
            <div class="container-fluid">

                <?php
                    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;
                ?>
                <table class="table table-hover" style="margin: auto">
                    <thead>
                        <tr>
                            <td>Nombre de usuario</td>
                            <td>Estado</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php

                        $query = "SELECT username, tarjeta FROM usuario ORDER BY tarjeta DESC, username ASC";

                        $sql = mysqli_query($connection, $query) or die("error");

                        while ($row = mysqli_fetch_array($sql)) {
                            ?>
                            <tr>
                                <td><?php echo $row['username']; ?></td>
                                <td><?php 
                                            if($row['tarjeta']=="0")
                                            {
                                                echo "Esperando tarjeta";
                                            }
                                            else if($row['tarjeta'])
                                            {
                                                echo "Tarjeta asignada"; 
                                            }
                                            else 
                                            {
                                                echo "Sin tarjeta";
                                            }
                                            ?></td>
                                <td>
                                    <a style="color: white;" data-toggle="modal" data-target="#delete" class="btn btn-primary" id="<?php echo $row['username'] ?>" onClick="showDetails(this)">
                                    Asignar nuevo
                                    </a>
                                </td>
                            </tr>
                        <?php
                    }
                    mysqli_close($connection);
                    ?>
                    </tbody>
                </table>
                <button type="button" onclick="setCodeStatus(false,'acceso_codigo')" class="btn btn-danger">Deshabilitar</button>
                <p>&nbsp;</p>

                <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Registrar tarjeta</h5>
                                <button type="button" class="close" onclick="closeAll()" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Desea asignar una nueva tarjeta?
                                Si ya se cuenta con una tarjeta, esta será desvinculada. 
                                Al hacer click en continuar, procederá a comenzar el registro
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onClick="confirmDelete()">Registrar</button>
                                <button type="button" class="btn btn-secondary" onclick="closeAll()"data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="registrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Registrando tarjeta</h5>
                                <button type="button" class="close" onclick="closeAll()" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>En el modulo empleados, pase una tarjeta no registrada para asignar a este usuario.</p>
                                <img src="../../images/load.gif" height="80" alt="Cargando">
                                <div id="status">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" onclick="closeAll()" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script src="../../js/vendor/jquery-3.3.1.slim.min.js"></script>
<script src="../../js/vendor/popper.min.js"></script>
<script src="../../js/vendor/bootstrap.min.js"></script>
<script>if (window.module) module = window.module;</script>
</html>