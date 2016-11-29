<?php

//require "../persistencia/emleado.php"
include_once("../persistencia/usuario.php");


// conexi�n al servidor de MySQL
//$conexion = conectarBD($bdhost, $bduser, $bdpass);

// conexi�n con la base de datos
//establecerBD($conexion, $bdbase);


//vemos si el usuario y contrase�a es v�lido, si existe esa conbinaci�n usuario/contrase�a
//echo $_POST["usuario"];

$usuario = htmlspecialchars($_POST["usuario"]);
$password = htmlspecialchars($_POST["contrasena"]);

//armado de los criterios de la consulta
//$criterios = " usuario = '" . $usuario . "' AND contrasena = '" . $contrasena . "'";

//ejecuci�n de la consulta para determinar si existe la combinaci�n usuario/password
//se obtiene la cantidad de registros a recuperar de la base (0 o 1)
//$cantreg = contarEnBD($conexion, "usuarios", $criterios);

$empleado;
$campos=array("ci","identificador","nombre","telefono","identificadorequipo","rolid","password","login","habilitado");

//$usuario="aamaral";
//$password="admin";
$criterios=array("login='$usuario'","password='$password'");
if (login_usuario($campos,$criterios, $empleado, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    if (!is_null($empleado))
{
    //usuario y contrase�a v�lidos
    //se define una sesi�n y guardan los datos
    session_name("loginUsuario");
    session_start();
    $_SESSION["usuario"] = $_POST["usuario"];

    // obtener los valores del registro le�do en la bd para determinar el grupo del usuario
    //$campos = "grupo, nombre, apellido";
    //$tabla = consultarEnBD($conexion, "usuarios", $campos, $criterios);
    $_SESSION["rol"] = $empleado['rolid'];
    $_SESSION["nombre"] = $empleado['nombre'];
    //$_SESSION["apellido"] = $tabla[0]["apellido"];
    $_SESSION["autentificado"] = "SI";
    $_SESSION["ultimoAcceso"] = date("Y-n-j H:i:s");
    $_SESSION["paginaAnterior"] = substr($_SERVER['SCRIPT_NAME'],strrpos($_SERVER['SCRIPT_NAME'],'/')+1);
    $_SESSION["mensajePasado"] = "";

    // se establece acceder al men� general de la aplicaci�n
    $salto = "Location: ../menu.php";
	
}
else
{
	if ($_POST["usuario"] == "")
	{
		//si no escribio usuario, se pide ingrese usuario
		$salto = "Location: ../index.php?errorusuario=us";		
	}
	else
	{
		if ($_POST["contrasena"] == "")
		{
			//si no escribio la contrase�a, se manda otra vez a la portada
			$salto = "Location: ../index.php?errorusuario=co";
		}
		else
		{
			//si no existe usuario, se manda otra vez a la portada
			$salto = "Location: ../index.php?errorusuario=si";			
		}
	}
}

}


// cerra la conexi�n
//desconectarBD($conexion);
print $salto;
// saltar a la pagina determinada en este script
header($salto);

?>					