<html> 

    <?php
    include_once("../../logica/feriado/feriado.php");
    session_start();

    $id=$_GET["id"];
    $descripcion=$_GET["descripcion"];
    $fecha=$_GET["fecha"];
   
   
    ?>

            <h1 class="auto-style1">Equipo</h1> 
            <form name="formulario" action="../../logica/feriado/feriado.php" method="POST"> 
                <table align="center" width="350" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        
                        <td><input type="hidden" name="id"  value="<?php echo $id ?>" ></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Fecha:</td> 
                        <td><input type="Text" name="fecha" size="12" maxlength="50" autocomplete="off" value="<?php echo $fecha ?>" ></td> 
                    </tr> 
                     <tr> 
                        <td align="right">Descripcion:</td> 
                        <td><input type="Text" name="descripcion" size="12" maxlength="50" autocomplete="off" value="<?php echo $descripcion ?>" ></td> 
                    </tr>
                     
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Modificar_Feriado">
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
