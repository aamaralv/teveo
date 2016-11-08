<?php

// si es necesario, cambiar la config. del php.ini desde el script

// se especifica que el m�dulo s�lo usar� cookies para almacenar el id de sesi�n en la parte del cliente.
ini_set("session.use_only_cookies","1");
// se especifica que NO se propague el id de sesion en forma automatica por las urls
ini_set("session.use_trans_sid","0");

// constante para contar la cantidad de "barras" / que hay en una url
$cantslash = 0;
// constante con el nombre del archivo de entrada a todo el sistema
$ruta = "index.php";

//cambiamos la duraci�n de la cookie de la sesi�n (DUDA va antes o despues de session_start ???)
session_set_cookie_params(0, "/", $_SERVER["HTTP_HOST"], 0);

//iniciamos la sesi�n
session_name("loginUsuario");
session_start();

//se obtiene la profundidad en el arbol de directorios
$cantslash = substr_count($_SERVER['SCRIPT_NAME'], "/"); 

//se genera la ruta al inicio de la aplicacion de acuerdo al arbol de directorios que se debe subir
for ($i = 1; $i <= ($cantslash -1); $i++)
	$ruta = "../" . $ruta;

if ($_SESSION["autentificado"] != "SI")
{
  //si no est� autenticado se envia el usuario a la p�gina de autenticaci�n
  header("Location: " . $ruta);
}
else
{
  //si esta autenticado, calculamos el tiempo transcurrido desde el ultimo ingreso a una pagina
  $fechaGuardada = $_SESSION["ultimoAcceso"];
  $ahora = date("Y-n-j H:i:s");
  $tiempo_transcurrido = (strtotime($ahora)-strtotime($fechaGuardada));

  //comparamos el tiempo transcurrido
  if($tiempo_transcurrido >= 600)
  {
    //si pasaron 10 minutos o m�s
	// Destruir todas las variables de sesi�n.
	$_SESSION = array();
	if (ini_get("session.use_cookies")) {
		$params = session_get_cookie_params();
		setcookie(session_name(), '', time() - 42000,
			$params["path"], $params["domain"],
			$params["secure"], $params["httponly"]
		);
	}
	// destruyo la sesi�n
    session_destroy(); 
	//se envia al usuario a la p�gina de autenticaci�n
	header("Location: " . $ruta); 
  }
  else
  {
    //sino, actualizo la fecha de la sesi�n
    $_SESSION["ultimoAcceso"] = $ahora;
  }
}

?>