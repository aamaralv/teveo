<html> 

    <?php
    include_once("../../logica/feriado/feriado.php");
    session_start();
   

    $id=$_GET["id"];
    
    
    $mensaje="";
    $error=borrar_feriado_logica($id, $mensaje);
    

    if($error){
        echo $mensaje,"<br>";
        die;
    }        
    header("Location: ../../presentacion/feriado/listarFeriados.php");
    
     session_destroy();
    
    ?>

