<html> 

    <?php
    include_once("../../logica/usuario/usuario.php");
    session_start();
   

    $ci=$_GET["CI"];
    $identificador=$_GET["identificador"];
    $habilitado=0;
    
    
    $mensaje="";
    $error=borrar_usuario_logica($ci,$identificador,$habilitado, $mensaje);
    

    if($error){
        echo $mensaje,"<br>";
        die;
    }        
    header("Location: ../../presentacion/usuario/listarusuarios.php");
    
     session_destroy();
    
    ?>

