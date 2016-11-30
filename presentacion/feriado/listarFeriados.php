<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../../logica/feriado/feriado.php");
    
    if (obtener_feriados($feriados, $mensaje)) {
        echo $mensaje . "<br>";
        
    }
    ?>


    <head> 
        <title>Lista de Feriados</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body> 
        <div align="center">
            <h1>Lista de Feriados</h1> 
            <br>
            <br>
            <?php
            //Creacion de una tabla para desplegar los empleados
            echo "<table>";
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo "<tr>";
            echo '<th scope="col">Fecha</th>';
            echo '<th scope="col">Descripcion</th>';
            echo "</tr>";
            //Listo todos las feriados
            $color_fila = '"#BBFFFF"';
            $cantElem = sizeof($feriados);
            for ($i = 0; $i < $cantElem; $i++) {
                echo "<tr bgcolor=" . $color_fila . ">";
                echo "<td>" . $feriados[$i]["fecha"] . "</td>" .
                "<td>" . $feriados[$i]["descripcion"] . "</td>" .
                "<td>" ."<a href='bajaFeriado.php?id=".$feriados[$i]["id"]."'</a>"."Borrar"."</td>".        
                "<td>" ."<a href='editarFeriado.php?id=".$feriados[$i]["id"].
                "&fecha=".$feriados[$i]["fecha"].
                "&descripcion=".$feriados[$i]["descripcion"]."'"."</a>Editar"."</td></tr>";

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