<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../../logica/equipo/equipo.php");
    if (obtener_equipos($equipos, $mensaje)) {
        echo $mensaje . "<br>";
    }
    ?>


    <head> 
        <title>Lista de Equipos</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body> 
        <div align="center">
            <h1>Lista de Equipos</h1> 
            <br>
            <br>
            <?php
            //Creacion de una tabla para desplegar los empleados
            echo "<table>";
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo "<tr>";
            echo '<th scope="col">Codigo Equipo</th>';
            echo '<th scope="col">Codigo Supervisor</th>';
            echo '<th scope="col">Cuota Dias Laborales</th>';
            echo '<th scope="col">Cuota Sabado</th>';
            echo '<th scope="col">Cuota Domingo</th>';
            echo '<th scope="col">Cuota Feriado</th>';
            echo '<th scope="col">Habilidades</th>';
            echo '<th scope="col">Codigo Zona</th>';
            echo "</tr>";
            //Listo todos las habilidades de la base en la tabla
            $color_fila = '"#BBFFFF"';
            $cantElem = sizeof($equipos);
            for ($i = 0; $i < $cantElem; $i++) {
                echo "<tr bgcolor=" . $color_fila . ">";
                echo "<td>" . $equipos[$i]["codigodeequipo"] . "</td>" .
                "<td>" . $equipos[$i]["supervisor"] . "</td>" .
                "<td>" . $equipos[$i]["cuotadiaslaborales"] . "</td>" .
                "<td>" . $equipos[$i]["cuotasabado"] . "</td>" .
                "<td>" . $equipos[$i]["cuotadomingo"] . "</td>" .
                "<td>" . $equipos[$i]["cuotaferiado"] . "</td>" .
                "<td>" . $equipos[$i]["habilidades"] . "</td>" .
                "<td>" . $equipos[$i]["codigozona"] . "</td>".
                "<td>" ."<a href='bajaequipo.php?codigoequipo=".$equipos[$i]["codigodeequipo"]."'</a>"."Borrar"."</td>".        
                "<td>" ."<a href='editarEquipo.php?codigoequipo=".$equipos[$i]["codigodeequipo"].
                "&supervisor=".$equipos[$i]["supervisor"].
                "&cuotadiaslaborales=".$equipos[$i]["cuotadiaslaborales"].
                "&cuotasabado=".$equipos[$i]["cuotasabado"].
                "&cuotadomingo=".$equipos[$i]["cuotadomingo"].
                "&cuotaferiado=".$equipos[$i]["cuotaferiado"].
                "&habilidades=".$equipos[$i]["habilidades"].
                "&codigozona=".$equipos[$i]["codigozona"]."'".
                "</a>Editar"."</td></tr>";

                if ($color_fila == '"#BBFFFF"') {
                    $color_fila = '"#FFFFFF"';
                } else {
                    $color_fila = '"#BBFFFF"';
                }
            }

            echo "</table>";
            ?>
            <br>  
            <br>
            <a href="../../menuempleados.php">Volver</a>
            <br>
            <a href="../../salir.php">Salir</a>
        </div>

    </body> 
</html> 