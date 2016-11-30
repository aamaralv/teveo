<html> 

    <?php
    include_once("../../logica/usuario/usuario.php");
    include_once("../../logica/rol/rol.php");
    session_start();
    
  
    
    $roles;
    if (listar_roles_logica($roles, $mensaje)) {
        echo $mensaje . "<br>";
    } else {
                
        $rolSelect = "<select name=rolid id=rolid>";
        foreach ($roles as $rol) {      
            $rolSelect.="<option "." value=" . $rol['id'] . ">" . $rol['nombre'] . "</option>\n";
            $selected="";
        }
        $rolSelect.= "</select>";
    }
    
    ?>

            <h1 class="auto-style1">Usuario</h1> 
            <form name="formulario" action="../../logica/usuario/usuario.php" method="POST"> 
                <table align="center" width="350" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        <td align="right">CI:</td> 
                        <td><input type="Text" name="CI"></td> 
                    </tr>
                    <tr> 
                        <td align="right">Identificador:</td> 
                        <td><input type="Text" name="identificador"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Nombre:</td> 
                        <td><input type="Text" name="nombre" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Password:</td> 
                        <td><input type="Text" name="password" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr>
                     <tr> 
                        <td align="right">Telefono:</td> 
                        <td><input type="Text" name="telefono" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Rol:</td> 
                        <td><?php echo $rolSelect; ?></td>
                    </tr> 
                     <tr> 
                        <td align="right">Login:</td> 
                        <td><input type="Text" name="login" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Identificador Equipo:</td> 
                        <td><input type="Text" name="identificadorequipo" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Habilitado:</td> 
 
                        <td>
                            <select name="habilitado" id="habilitado">
                                <option value="1">SI</option>
                                <option value="0">NO</option>
                            </select>
                        </td> 
                     </tr> 
                    
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Crear_Usuario">
                        </td> 
                    </tr> 
                    <tr> 
                        <td align="center"><a href="../../menuempleados.php">volver</a></td> 
                    </tr> 
                </table> 
            </form> 

            <?php
      session_destroy();
          
        
        ?>

    </body> 
</html> 
