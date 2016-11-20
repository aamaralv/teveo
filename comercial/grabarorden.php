<?php 
include ("../seguridad/seguridad.php");
include ("../persistencia/conexion.php");
include ("../persistencia/funcionesBD.php");
//conecto con la base de datos
$conexion = conectarBD($bdhost, $bduser, $bdpass);						 
//selecciono la BBDD
establecerBD($conexion, $bdbase);

$tabla = "ordentrabajo";

$campos = "Numero, TipoOrden, TipoTarea, SistemaEmisor, TipoProducto, FechaHoraCreacion, UsuarioCreador, " . 
          "FechaPrevista, Equipo, NombreCliente, ApellidoCliente, Cedula, Telefono, Direccion, Localidad, ". 
          "Departamento, Estado, CodigoZona, Prioridad, Horario, Comentario, FuncionesRequeridas";

$TipoOrden = "'" . $_SESSION["orden"]["TipoOrden"] . "', ";
$TipoTarea = "'" . $_SESSION["orden"]["TipoTarea"] . "', ";
$SistemaEmisor = "'" . $_SESSION["orden"]["SistemaEmisor"] . "', ";
$TipoProducto = "'" . $_SESSION["orden"]["TipoProducto"] . "', ";
$FechaHoraCreacion =  "'". date("Y-m-d H:i:s") . "', "; 
$usuario = "'" . $_SESSION["usuario"] . "', ";
$FechaPrevista = "'" . date('Y-m-d', strtotime(substr($_SESSION["orden"]["FechaPrevista"],10, 4) . "-" . substr($_SESSION["orden"]["FechaPrevista"],5, 2) . "-" . substr($_SESSION["orden"]["FechaPrevista"],0, 2))) . "', ";
$Equipo = "'" . $_SESSION["orden"]["Equipo"] . "', "; 
$NombreCliente = "'" . $_SESSION["orden"]["NombreCliente"] . "', ";
$ApellidoCliente = "'" . $_SESSION["orden"]["ApellidoCliente"] . "', ";
$Cedula = "'" . $_SESSION["orden"]["Cedula"] . "', ";
$Telefono = "'" . $_SESSION["orden"]["Telefono"] . "', ";
$Direccion = "'" . $_SESSION["orden"]["Direccion"]. "', ";
$Localidad = "'" . $_SESSION["orden"]["Localidad"] . "', ";
$Departamento = "'" . $_SESSION["orden"]["Departamento"] . "', ";
$Estado = "'programada', ";
$CodigoZona = "'" . $_SESSION["orden"]["CodigoZona"] . "', ";
$Prioridad = "'0', ";
$Horario = "'" . $_SESSION["orden"]["Horario"] . "', ";
$Comentario = "'" . $_SESSION["orden"]["Comentario"] . "', ";
$FuncionesRequeridas = "'" . $_SESSION["orden"]["FuncionesRequeridas"] . "'";

echo "campos: " . $campos . "<br>";

$valores = "NULL, " . $TipoOrden . $TipoTarea  . $SistemaEmisor . $TipoProducto . $FechaHoraCreacion . $usuario . $FechaPrevista . $Equipo . $NombreCliente . $ApellidoCliente . 
           $Cedula . $Telefono . $Direccion . $Localidad . $Departamento . $Estado . $CodigoZona . $Prioridad . $Horario . $Comentario . $FuncionesRequeridas;

echo "valores: " . $valores . "<br>";

$nroorden = insertarEnBD($conexion, $tabla, $campos, $valores);

echo "orden insertada : " . $nroorden . "<br>";

?>