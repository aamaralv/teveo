<?php
include_once ("seguridad/seguridad.php");
$_SESSION["mensajePasado"] = "";
?> 
<html>
    <head>
        <title>Menu gestión de usuarios</title>
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
            .auto-style2 {
                text-align: right;
            }
        </style>
    </head>
    <body>
        <h1 class="auto-style1">&nbsp;</h1>
        <h1 class="auto-style1">Menu Gestion de Empleados</h1>
        <h2 class="auto-style1">Elija su opcion</h2>
        <table style="width: 100%">
            <tr>
                <td style="width: 49%" rowspan="2" class="auto-style2"></td>
                <td style="width: 2%" nowrap="nowrap">
                    <br>
                    <hr>
                    <a href="presentacion/listaempleados.php">Lista de empleados</a> 
                    <br>  
                    <br>
                    <a href="presentacion/altaempleado.php">Alta de empleado</a>
                    <br>  
                    <br>
                    <a href="">Modificacion de empleado</a>
                    <br>  
                    <br>
                    <a href="">Baja de empleado</a>
                    <br>  
                    <br>
                </td>
                <td style="width: 49%" rowspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 2%" nowrap="nowrap" class="auto-style1">
                    <hr>
                    <a href="menu.php">Volver</a>
                    <br><a href="salir.php">Salir</a>
                    <hr>
                </td>
            </tr>
        </table>
    </body>
</html>