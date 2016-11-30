<html> 

    <?php
    include_once("../../logica/equipo/equipo.php");
    session_start();

    $codigoequipo=$_GET["codigoequipo"];
    $supervisor=$_GET["supervisor"];
    $cuotadiaslaborales=$_GET["cuotadiaslaborales"];
    $cuotasabado=$_GET["cuotasabado"];
    $cuotadomingo=$_GET["cuotadomingo"];
    $cuotaferiado=$_GET["cuotaferiado"];
    $habilidades=$_GET["habilidades"];
    $codigozona=$_GET["codigozona"];
    
   
    ?>

            <h1 class="auto-style1">Equipo</h1> 
            <form name="formulario" action="../../logica/equipo/equipo.php" method="POST"> 
                <table align="center" width="350" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        
                        <td><input type="hidden" name="codigoequipo"  value="<?php echo $codigoequipo ?>" ></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Supervisor:</td> 
                        <td><input type="Text" name="supervisor" size="12" maxlength="50" autocomplete="off" value="<?php echo $supervisor ?>" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Cuota Dias Laborales:</td> 
                        <td><input type="Text" name="cuotadiaslaborales" size="12" maxlength="50" autocomplete="off" value="<?php echo $cuotadiaslaborales ?>" ></td> 
                    </tr>
                     <tr> 
                        <td align="right">Cuota Sabado:</td> 
                        <td><input type="Text" name="cuotasabado" size="12" maxlength="50" autocomplete="off" value="<?php echo $cuotasabado ?>" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Cuota Domingo:</td> 
                        <td><input type="Text" name="cuotadomingo" size="12" maxlength="50" autocomplete="off" value="<?php echo $cuotadomingo ?>" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Cuotas Feriado:</td> 
                        <td><input type="Text" name="cuotaferiado" size="12" maxlength="50" autocomplete="off" value="<?php echo $cuotaferiado ?>" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Habilidades:</td> 
                        <td><input type="Text" name="habilidades" size="12" maxlength="50" autocomplete="off" value="<?php echo $habilidades ?>" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Codigo Zona:</td> 
                        <td><input type="Text" name="codigozona" size="12" maxlength="50" autocomplete="off" value="<?php echo $codigozona ?>" ></td> 
                    </tr> 
                    
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Modificar_Equipo">
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
