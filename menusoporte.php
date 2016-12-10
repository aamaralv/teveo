<?php
include_once ("seguridad/seguridad.php");
$_SESSION["paginaAnterior"] = substr($_SERVER['SCRIPT_NAME'],strrpos($_SERVER['SCRIPT_NAME'],'/')+1);
$_SESSION["mensajePasado"] = "";
?> 
<html>
    <head>
        <title>Menu soporte</title>
    </head>
    <body align="center">
        <h1 class="auto-style1">&nbsp;</h1>
        <h1 class="auto-style1">Menu Soporte</h1>
        <h2 class="auto-style1">Elija su opcion</h2>
            <table align="center" width="200" cellspacing="2" cellpadding="2" border="0">
            <tr>
                <td align="left">
				    <hr>
                    <br>					
                    <a href="soporte/controladorGeneraOTsoporte.php">Crear OT reclamo</a> 
                    <br>  
                </td>
            </tr>
 <!--           <tr>
                <td align="left">
                    <br>
                    <a href="consultarordenes/controladorListarOrdenes.php">Consultar Ordenes de trabajo</a> 
                    <br>  
                </td>
            </tr>
-->            <tr>
                <td align="center" nowrap="nowrap">
                    <br>
					<hr>
                    <a href="menu.php">Volver</a>
                    <br><a href="salir.php">Salir</a>
                    <hr>
                </td>
            </tr>
        </table>
    </body>
</html>