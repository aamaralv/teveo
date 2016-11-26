<?php
include_once("../persistencia/usuario.php");
session_start();
if (isset($_POST['Ingresar_Empleado'])) {
    $CI = $_REQUEST["CI"];
    $nombre = $_REQUEST["Nombre"];
    $apellido = $_REQUEST["Apellido"];
    $telefono = $_REQUEST["Telefono"];
    $identificadorequipo = $_REQUEST["Equipo"];
    $rolid = $_REQUEST["Rol"];
    $usuario = $_REQUEST["Login"];
    $password = $_REQUEST["PASS"];
    $supervisor = $_REQUEST["Supervisor"];
    $habilitado = $_REQUEST["Habilidado"];
//echo "CI ",$CI ,"identificador ",$identificador ,"nombre ",$nombre,"telefono ",$telefono,"equipo ",$equipo,"rol ",$rol," login ",$login," pass ",$contraseña," habi ",$habilidado ."<br>";
//echo "HABILITADO=".$habilitado."<br>";
    $mensaje = "";
    $campos=array("ci","usuario","password","nombre","apellido","telefono","rolid","identificadorsupervisor","identificadorequipo","habilitado");
    $valores=array("'$CI'","'$usuario'","'$password'","'$nombre'","'$apellido'","'$telefono'",$rolid,"'$supervisor'","'$identificadorequipo'",$habilitado);
    if (insertar_usuario($campos,$valores, $mensaje)) {
        $_SESSION['mensaje'] = $mensaje;
        $_SESSION['altacliente'] = false;
    } else {
        $_SESSION['mensaje'] = "El usuario fue registrado con exito!<br>";
        $_SESSION['altacliente'] = true;
    }
    header('Location: ../presentacion/altausuario.php');
}
function obtener_usuarios(&$usuarios, &$mensaje) {
	$campos=array("ci","usuario","password","nombre","apellido","telefono","rolid","identificadorsupervisor","identificadorequipo","habilitado");
	$criterios=array();
	listar_usuarios($campos,$criterios,$usuarios,$mensaje);
}
?>