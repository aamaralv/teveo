<html> 

    <?php
    include_once("../../logica/equipo/equipo.php");
    session_start();

  
    ?>

            <h1 class="auto-style1">Equipo</h1> 
            <form name="formulario" action="../../logica/equipo/equipo.php" method="POST"> 
                <table align="center" width="350" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        <td align="right">Codigo Equipo:</td> 
                        <td><input type="Text" name="codigoequipo"></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Supervisor:</td> 
                        <td><input type="Text" name="supervisor" size="12" maxlength="50" autocomplete="off" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Cuota Dias Laborales:</td> 
                        <td><input type="Text" name="cuotadiaslaborales" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr>
                     <tr> 
                        <td align="right">Cuota Sabado:</td> 
                        <td><input type="Text" name="cuotasabado" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Cuota Domingo:</td> 
                        <td><input type="Text" name="cuotadomingo" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Cuotas Feriado:</td> 
                        <td><input type="Text" name="cuotaferiado" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Habilidades:</td> 
                        <td><input type="Text" name="habilidades" size="12" maxlength="50" autocomplete="off" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Codigo Zona:</td> 
                        <td><input type="Text" name="codigozona" size="12" maxlength="50" autocomplete="off"></td> 
                    </tr> 
                    
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Crear_Equipo">
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