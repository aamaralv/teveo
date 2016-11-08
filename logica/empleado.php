<?php

include_once("../persistencia/empleado.php");
session_start();
if (isset($_POST['Ingresar_Empleado'])) {

    $CI = $_REQUEST["CI"];

    $identificadorempleado = $_REQUEST["Identificador"];
    $_SESSION['Identificador'] = $identificadorempleado;

    $nombre = $_REQUEST["Nombre"];

    $telefono = $_REQUEST["Telefono"];

    $identificadorequipo = $_REQUEST["Equipo"];

    $rolid = $_REQUEST["Rol"];

    $login = $_REQUEST["Login"];

    $password = $_REQUEST["PASS"];

    $habilitado = $_REQUEST["Habilidado"];

//echo "CI ",$CI ,"identificador ",$identificador ,"nombre ",$nombre,"telefono ",$telefono,"equipo ",$equipo,"rol ",$rol," login ",$login," pass ",$contraseña," habi ",$habilidado ."<br>";
//echo "HABILITADO=".$habilitado."<br>";
    $mensaje = "";
    if (insertar_empleado($CI, $identificadorempleado, $nombre, $telefono, $identificadorequipo, $rolid, $password, $login, $habilitado, $mensaje)) {
        $_SESSION['mensaje'] = $mensaje;
        $_SESSION['altacliente'] = false;
    } else {
        $_SESSION['mensaje'] = "El empleado fue registrado con exito!<br>";
        $_SESSION['altacliente'] = true;
    }

    header('Location: ../presentacion/altaempleado.php');
}

function obtener_empleados(&$empleados, &$mensaje) {
	listar_empleados($empleados,$mensaje);
}

?>	
