<html> 

    <!--
    // UDE - Ingenier�a en Inform�tica - Desarrollo de Aplicaciones PHP - Curso 2016
    // Integrantes : Alexander Amaral
    //               Gaston Rodriguez
    //               Victorio Cecot
    //
    --> 
    <?php
    include_once("../logica/equipo.php");
    include_once("../logica/rol.php");

    session_start();

    $equipos;
    if (listar_equiposx($equipos, $mensaje)) {
        echo $mensaje . "<br>";
    } else {
        $equipoSelect = "<select name=Equipo id=Equipo>";
        foreach ($equipos as $key => $equipo) {

            $equipoSelect.="<option value=" . $equipo['identificador'] . ">" . $equipo['identificador'] . "</option>\n";
        }
        $equipoSelect.= "</select>";
    }

    $roles;
    if (listar_roles_logica($roles, $mensaje)) {
        echo $mensaje . "<br>";
    } else {
        $rolSelect = "<select name=Rol id=Rol>";
        foreach ($roles as $key => $rol) {
            $rolSelect.="<option value=" . $rol['id'] . ">" . $rol['nombre'] . "</option>\n";
        }
        $rolSelect.= "</select>";
    }
    /* echo "<pre>";
      print_r($_SESSION);
      echo "</pre>"; */
    ?>


    <head> 
        <title>Autenticaci�n</title> 
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
        </style>
    </head> 
    <body onLoad="document.formulario.usuario.focus()"> 
        <h1><br><br></h1>
<?php
if (isset($_SESSION["mensaje"])) {
    echo '<table align="center" width="450" cellspacing="2" cellpadding="2" border="0"> ';
    $respuesta = "<h1 class=" . "'auto-style1'" . ">" . $_SESSION['mensaje'] . "</h1>";
    if ($_SESSION['altacliente'] === true) {

        echo "<tr>";
        echo '<td align="center">' . $respuesta . '</td>';
        echo "</tr>";
        echo "<tr>";

        echo '<td align="left"><a href="altausuario.php">Volver</a></td>';
        echo "</tr>";
    } 
    echo '</table>';

    session_destroy();
    unset($_SESSION['mensaje']);
    unset($_SESSION['altacliente']);
    unset($_SESSION['Identificador']);
} else {
    ?>
            <h1 class="auto-style1">Usuario</h1> 
            <form name="formulario" action="../logica/usuario.php" method="POST"> 
                <table align="center" width="225" cellspacing="2" cellpadding="2" border="0"> 
                    <tr> 
                        <td align="right">CI:</td> 
                        <td><input type="Text" name="CI" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Nombre:</td> 
                        <td><input type="Text" name="Nombre" size="12" maxlength="50"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Apellido:</td> 
                        <td><input type="Text" name="Apellido" size="12" maxlength="50"></td> 
                    </tr>
                    <tr> 
                        <td align="right">Telefono:</td> 
                        <td><input type="Text" name="Telefono" size="12" maxlength="50"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Equipo:</td> 
                        
                         <td><input type="Text" name="Equipo" size="12" maxlength="50"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Rol</td> 
                        <td><?php echo $rolSelect; ?></td>    
                    </tr>

                    <tr> 
                        <td align="right">Supervisor:</td> 
                        <td><input type="Text" name="Supervisor" size="12" maxlength="50"></td> 
                    </tr> 

                    <tr> 
                        <td align="right">Login:</td> 
                        <td><input type="Text" name="Login" size="12" maxlength="50"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Contrase�a:</td> 
                        <td><input type="password" name="PASS" size="12" maxlength="50"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Habilidado:</td> 
                        <td>
                            <select name="Habilidado" id="Habilidado">
                                <option value="1">SI</option>
                                <option value="0">NO</option>
                            </select>
                        </td> 
                    </tr> 
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Ingresar" name="Ingresar_Empleado">
                        </td> 
                    </tr> 
                    <tr> 
                        <td align="center"><a href="../menuempleados.php">volver</a></td> 
                    </tr> 
                </table> 
            </form> 

            <?php
            session_destroy();
            unset($_SESSION['mensaje']);
            unset($_SESSION['altacliente']);
        }
        ?>

    </body> 
</html> 
