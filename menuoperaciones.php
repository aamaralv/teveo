<?php
include_once ("seguridad/seguridad.php");
$_SESSION["mensajePasado"] = "";
?> 
<html>
    <head>
        <title>Menu area operaciones</title>
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
        <h1 class="auto-style1">Menu area operaciones</h1>
        <h2 class="auto-style1">Elija su opcion</h2>
        <table style="width: 100%">
            <tr>
                <td style="width: 49%" rowspan="2" class="auto-style2"></td>
                <td style="width: 2%" nowrap="nowrap">
                    <br>
                    <hr>
                    <a href="operaciones/controladorOperaciones.php">Gestionar Ordenes  de Trabajo</a> 
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