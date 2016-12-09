<?php

include_once("../persistencia/usuario.php");

//vemos si el usuario y contraseña es válido, si existe esa conbinación usuario/contraseña

$usuario = htmlspecialchars($_POST["usuario"]);
$password = htmlspecialchars($_POST["contrasena"]);

//ejecución de la consulta para determinar si existe la combinación usuario/password

$empleado;
$campos=array("ci","identificadorsupervisor","nombre", "apellido", "telefono","identificadorequipo","rolid","password","login");

$criterios=array("login='$usuario'","password='$password'");
if (login_usuario($campos,$criterios, $empleado, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    if (!is_null($empleado))
{
    //usuario y contraseña válidos
    //se define una sesión y guardan los datos
    session_name("loginUsuario");
    session_start();
    $_SESSION["usuario"] = $_POST["usuario"];
    // obtener los valores del registro leído en la bd para determinar el grupo del usuario
    $_SESSION["rol"] = $empleado[0]['rolid'];
    $_SESSION["nombre"] = $empleado[0]['nombre'];
	$_SESSION["apellido"] = $empleado[0]['apellido'];
	$_SESSION["identificadorequipo"] = $empleado[0]['identificadorequipo'];
	$_SESSION["identificadorsupervisor"] = $empleado[0]['identificadorsupervisor'];
    $_SESSION["autentificado"] = "SI";
    $_SESSION["ultimoAcceso"] = date("Y-n-j H:i:s");
    $_SESSION["paginaAnterior"] = substr($_SERVER['SCRIPT_NAME'],strrpos($_SERVER['SCRIPT_NAME'],'/')+1);
    $_SESSION["mensajePasado"] = "";

    // se establece acceder al menú general de la aplicación
    $salto = "Location: ../menu.php";
	
}
else
{
	if ($_POST["usuario"] == "")
	{
		//si no escribió usuario, se pide ingrese usuario
		$salto = "Location: ../index.php?errorusuario=us";		
	}
	else
	{
		if ($_POST["contrasena"] == "")
		{
			//si no escribió la contraseña, se manda otra vez a la portada
			$salto = "Location: ../index.php?errorusuario=co";
		}
		else
		{
			//si no existe usuario, se manda otra vez al index
			$salto = "Location: ../index.php?errorusuario=si";			
		}
	}
}

}

// saltar a la pagina determinada en este script
header($salto);

?>					