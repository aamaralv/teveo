<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../../logica/usuario/usuario.php");
    include_once("../../logica/rol/rol.php");
    
    $empleados;
    if (obtener_usuarios($empleados, $mensaje)) {
        echo $mensaje . "<br>";
    }
    
    $roles;
    if (listar_roles_logica($roles, $mensaje)) {
        echo $mensaje . "<br>";
    }
    
    ?>


    <head> 
        <title>Lista de Usuarios</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body> 
        <div align="center">
            <h1>Lista de Usuarios</h1> 
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
            echo '<th scope="col">Login</th>';
            echo '<th scope="col">Telefono</th>';
            echo '<th scope="col">Password</th>';
            echo '<th scope="col">Rol Id</th>';
            echo '<th scope="col">Identificador Equipo</th>';
            echo '<th scope="col">Habilitado</th>';
            echo "</tr>";
            //Listo todos los empleados de la base en la tabla
            $color_fila = '"#BBFFFF"';
            $cantElem = sizeof($empleados);
            $habilitado="";
            $nombre_rol="";
            for ($i = 0; $i < $cantElem; $i++) {
                if($empleados[$i]["habilitado"]==1){
                    $habilitado="SI";
                }
                else{
                    $habilitado="NO";
                }
                foreach ($roles as $rol) {
                    if($rol['id']==$empleados[$i]["rolid"]){
                        $nombre_rol=$rol['nombre'];
                    }
           
                }
                               
                echo "<tr bgcolor=" . $color_fila . ">";
                echo "<td>", $empleados[$i]["ci"] ,"</td>",
                "<td>" ,$empleados[$i]["identificador"] ,"</td>",
                "<td>" ,$empleados[$i]["nombre"] , "</td>",
                "<td>" ,$empleados[$i]["login"] , "</td>",
                "<td>" ,$empleados[$i]["telefono"] , "</td>",         
                "<td>" ,$empleados[$i]["password"] , "</td>",
                "<td>" ,$nombre_rol , "</td>",
                "<td>" ,$empleados[$i]["identificadorequipo"] , "</td>",
                "<td>" ,$habilitado, "</td>".
                "<td>" ."<a href='bajausuario.php?CI=".$empleados[$i]["ci"]. "&identificador=".$empleados[$i]["identificador"]."'</a>"."Borrar"."</td>".        
                "<td>" ."<a href='editarusuario.php?CI=".$empleados[$i]["ci"]. "&identificador=".$empleados[$i]["identificador"].
                "&nombre=".$empleados[$i]["nombre"].
                "&login=".$empleados[$i]["login"].
                "&telefono=".$empleados[$i]["telefono"].        
                "&password=".$empleados[$i]["password"].
                "&rolid=".$empleados[$i]["rolid"].
                "&identificadorequipo=".$empleados[$i]["identificadorequipo"].
                "&habilitado=".$empleados[$i]["habilitado"]."'".
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