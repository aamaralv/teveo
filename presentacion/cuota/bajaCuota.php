<html> 

    <?php
    include_once("../../logica/cuota/cuota.php");
    session_start();
   

    $id=$_GET["id"];
    
    
    $mensaje="";
    $error=borrar_cuota_logica($id, $mensaje);
    

    if($error){
        echo $mensaje,"<br>";
        die;
    }        
    header("Location: ../../presentacion/cuota/listarCuotas.php");
    
     session_destroy();
    
    ?>

