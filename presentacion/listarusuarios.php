<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../logica/usuario.php");
    $empleados;
    if (obtener_usuarios($empleados, $mensaje)) {
        echo $mensaje . "<br>";
    }
    ?>


    <head> 
        <title>Lista de Empleados</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body> 
        <div align="center">
            <h1>Lista de Empleados</h1> 
            <br>
            <br>
            <?php
            //Creacion de una tabla para desplegar los empleados
            echo "<table>";
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo "<tr>";
            echo '<th scope="col">CI</th>';
            echo '<th scope="col">Usuario</th>';
            echo '<th scope="col">Nombre</th>';
            echo "</tr>";
            //Listo todos los empleados de la base en la tabla
            $color_fila = '"#BBFFFF"';
            $cantElem = sizeof($empleados);
            for ($i = 0; $i < $cantElem; $i++) {
                echo "<tr bgcolor=" . $color_fila . ">";
                echo "<td>" . $empleados[$i]["ci"] . "</td><td>" . $empleados[$i]["usuario"] . "</td><td>" . $empleados[$i]["nombre"] . "</td>";
                echo "</tr>";
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
            <a href="../menuempleados.php">Volver</a>
            <br>
            <a href="../salir.php">Salir</a>
        </div>

    </body> 
</html> 