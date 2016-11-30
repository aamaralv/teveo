<?php
include_once("../../persistencia/usuario.php");

if (isset($_POST['Crear_Usuario'])) {

    $CI = $_REQUEST["CI"];
    $identificador = $_REQUEST["identificador"];
    $nombre = $_REQUEST["nombre"];
    $password = $_REQUEST["password"];
    $telefono = $_REQUEST["telefono"];
    $rolid = $_REQUEST["rolid"];
    $login = $_REQUEST["login"];
    $identificadorequipo = $_REQUEST["identificadorequipo"];
    $habilitado = $_REQUEST["habilitado"];

    $mensaje = "";
 
    $campos=array("ci","identificador","nombre","password","telefono","rolid","login","identificadorequipo","habilitado");
    $valores=array($CI,"'$identificador'","'$nombre'","'$password'","'$telefono'",$rolid,"'$login'","'$identificadorequipo'",$habilitado);
    $error=insertar_usuario($campos,$valores, $mensaje);
       
  
    if($error){
        echo$mensaje,"<br>";
        die;
    }   
    header("Location: ../../presentacion/usuario/listarusuarios.php");

    
}elseif (isset($_POST['Modificar_Usuario'])) {
    
    $CI = $_REQUEST["CI"];
    $identificador = $_REQUEST["identificador"];
    $nombre = $_REQUEST["nombre"];
    $password = $_REQUEST["password"];
    $telefono = $_REQUEST["telefono"];
    $rolid = $_REQUEST["rolid"];
    $login = $_REQUEST["login"];
    $identificadorequipo = $_REQUEST["identificadorequipo"];
    $habilitado = $_REQUEST["habilitado"];

    $mensaje = "";

    $valores=array(
     "nombre='".$nombre."'",
     "telefono='".$telefono."'",
     "identificadorequipo='".$identificadorequipo."'",
     "rolid=".$rolid,
     "password='".$password."'",
     "login='".$login."'",
     "habilitado=".$habilitado);	
    $criterios=array("ci=".$CI,"identificador='".$identificador."'");

    
    
    $error=actualizar_usuario($valores,$criterios,$mensaje);
    if($error){
        echo$mensaje,"<br>";
        die;
    }
   
    header("Location: ../../presentacion/usuario/listarusuarios.php");
       
    
}
function obtener_usuarios(&$usuarios, &$mensaje) {
	$campos=array("ci","identificador","password","nombre","telefono","rolid","identificadorequipo","habilitado","login");
	$criterios=array();
	$error=listar_usuarios($campos,$criterios,$usuarios,$mensaje);
        return $error;
}

function borrar_usuario_logica($ci,$identificador,$habilitado, &$mensaje) {
    $valores=array("habilitado=".$habilitado);
    $criterios = array("ci=".$ci,"identificador='".$identificador."'");
    $error=actualizar_usuario($valores,$criterios,$mensaje);
    return $error; 
}
    

?>