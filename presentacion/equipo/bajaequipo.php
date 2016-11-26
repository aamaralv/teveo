<html> 

    <?php
    include_once("../../logica/equipo/equipo.php");
    session_start();
   

    $codigoequipo=$_GET["codigoequipo"];
    
    
    $mensaje="";
    $error=borrar_equipo_logica($codigoequipo, $mensaje);
    

    if($error){
        echo $mensaje,"<br>";
        die;
    }        
    header("Location: ../../presentacion/equipo/listarEquipos.php");
    
     session_destroy();
    
    ?>

