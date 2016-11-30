<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../../logica/cuota/cuota.php");
    
    if (obtener_cuotas($cuotas, $mensaje)) {
        echo $mensaje . "<br>";
        
    }
    
    ?>


    <head> 
        <title>Lista de Cuotas</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body> 
        <div align="center">
            <h1>Lista de Cuotas</h1> 
            <br>
            <br>
            <?php
            //Creacion de una tabla para desplegar los empleados
            echo "<table>";
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo "<tr>";
            echo '<th scope="col">Equipo</th>';
            echo '<th scope="col">Fecha Cambio</th>';
            echo '<th scope="col">Usuario Cambio</th>';
            echo '<th scope="col">Fecha Cuota</th>';
            echo '<th scope="col">Cuota</th>';
            echo "</tr>";
            //Listo todos las cuotas
            $color_fila = '"#BBFFFF"';
        
            $cantElem = sizeof($cuotas);

            for ($i = 0; $i < $cantElem; $i++) {
                
                echo "<tr bgcolor=" . $color_fila . ">";
                
                echo "<td>" . $cuotas[$i]["equipo"] . "</td>" .
                "<td>" . $cuotas[$i]["fecha_cambio"] . "</td>" .
                "<td>" . $cuotas[$i]["usuario_cambio"] . "</td>" .
                "<td>" . $cuotas[$i]["fecha_aplicacion"] . "</td>" .
                "<td>" . $cuotas[$i]["cuota"] . "</td>" .
                "<td>" ."<a href='bajaCuota.php?id=".$cuotas[$i]["id"]."'</a>"."Borrar"."</td>".        
                "<td>" ."<a href='editarFeriado.php?id=".$cuotas[$i]["id"].
                "&fecha=".$cuotas[$i]["equipo"].
                "&descripcion=".$cuotas[$i]["fecha_cambio"]."'"."</a>Editar"."</td></tr>";

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