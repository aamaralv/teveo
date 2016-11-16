<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../logica/habilidad.php");
    //$empleados;
    if (listar_habilidades_logica($habilidades, $mensaje)) {
        echo $mensaje . "<br>";
    }
    ?>


    <head> 
        <title>Lista de Habilidades</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body> 
        <div align="center">
            <h1>Lista de Habilidades</h1> 
            <br>
            <br>
            <?php
            //Creacion de una tabla para desplegar los empleados
            echo "<table>";
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo '<col style="width: 200px" />';
            echo "<tr>";
            echo '<th scope="col">Codigo</th>';
            echo '<th scope="col">Descripcion</th>';
            echo "</tr>";
            //Listo todos las habilidades de la base en la tabla
            $color_fila = '"#BBFFFF"';
            $cantElem = sizeof($habilidades);
            for ($i = 0; $i < $cantElem; $i++) {
                echo "<tr bgcolor=" . $color_fila . ">";
                echo "<td>" . $habilidades[$i]["codigo"] . "</td><td>" . $habilidades[$i]["descripcion"] . "</td><td>". "<a href='editarhabilidad.php?id=".$habilidades[$i]["id"] . "&codigo=".$habilidades[$i]["codigo"] ."&descripcion=".$habilidades[$i]["descripcion"]."'". "</a>Editar";
                echo "</tr>";
                if ($color_fila == '"#BBFFFF"') {
                    $color_fila = '"#FFFFFF"';
                } else {
                    $color_fila = '"#BBFFFF"';
                }
            }


            /*<a href="house.php?id=<?php echo $house_id;?>">
  <?php echo $house_name;?>
</a>*/
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