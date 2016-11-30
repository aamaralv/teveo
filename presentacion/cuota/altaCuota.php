<html> 

    <?php
    include_once("../../logica/equipo/equipo.php");
    include_once("../../logica/feriado/feriado.php");
    session_start();

  
    ?>

            <h1 class="auto-style1">Cuota</h1> 
            <form name="formulario" action="../../logica/cuota/cuota.php" method="POST"> 
                <table align="center" width="350" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        <td align="right">Equipo</td> 
                        <td>  
                        <?php

                           if (obtener_equipos($equipos, $mensaje)) {
                                echo $mensaje . "<br>";
                            }
                          
							$cantElem = sizeof($equipos);
                            echo "<select name = 'equipo'>";
                            
                            echo '<option value = "">Elija equipo</option>';
							for ($i = 0; $i < $cantElem; $i++)
							{
                                echo "<option value = " .$equipos[$i]["codigodeequipo"] . ">" . $equipos[$i]["codigodeequipo"] . "</option>";
 							}
                            echo "</select>";

                        ?>

                        </td> 
                       
                    </tr> 
                    <tr> 
                        <td align="right">Fecha:</td> 
                        <td><input type="date" name="fecha" ></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Cuota:</td> 
                        <td><input type="Text" name="cuota" size="12" maxlength="50" autocomplete="off" ></td> 
                    </tr> 
                     
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Crear_Cuota">
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