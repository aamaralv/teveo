<html> 

    <?php
    include_once("../../logica/feriado/feriado.php");
    session_start();

  
    ?>

            <h1 class="auto-style1">Feriado</h1> 
            <form name="formulario" action="../../logica/feriado/feriado.php" method="POST"> 
                <table align="center" width="350" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        <td align="right">Fecha(mm-dd-yyyy)</td> 
                        <td>  <input type="date" name="fecha" ></td> 
                       
                    </tr> 
                    <tr> 
                        <td align="right">Desripcion:</td> 
                        <td><input type="Text" name="descripcion" size="12" maxlength="50" autocomplete="off" ></td> 
                    </tr> 
                     
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Crear_Feriado">
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