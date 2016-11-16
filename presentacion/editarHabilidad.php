<html> 

    <?php
    include_once("../logica/habilidad.php");
    session_start();

    $id=$_GET["id"];
    $codigo=$_GET["codigo"];
    $descripcion=$_GET["descripcion"];
    ?>

            <h1 class="auto-style1">Habilidad</h1> 
            <form name="formulario" action="../logica/habilidad.php" method="POST"> 
                <table align="center" width="225" cellspacing="2" cellpadding="2" border="0"> 
                     <tr> 
                        
                        <td><input type="hidden" name="id"  value="<?php echo $id ?>" ></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Codigo:</td> 
                        <td><input type="Text" name="codigo" size="12" maxlength="50" autocomplete="off" value="<?php echo $codigo ?>" ></td> 
                    </tr> 
                    <tr> 
                        <td align="right">Descripcion:</td> 
                        <td><input type="Text" name="descripcion" size="12" maxlength="50" value="<?php echo $descripcion ?>"></td> 
                    </tr> 
                    
                    <tr> 
                        <td colspan="2" align="left">
                            <input type="Submit" value="Guardar" name="Modificar_Habilidad">
                        </td> 
                    </tr> 
                    <tr> 
                        <td align="center"><a href="../menuempleados.php">volver</a></td> 
                    </tr> 
                </table> 
            </form> 

            <?php
      session_destroy();
          
        
        ?>

    </body> 
</html> 
