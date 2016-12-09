<?php 
include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$tabla = "ordentrabajo";

$campos = "Numero, TipoOrden, TipoTarea, SistemaEmisor, TipoProducto, FechaHoraCreacion, UsuarioCreador, " . 
          "FechaPrevista, Equipo, NombreCliente, ApellidoCliente, Cedula, Telefono, Direccion, Localidad, ". 
          "Departamento, Estado, CodigoZona, Prioridad, Horario, Comentario, FuncionesRequeridas";

$TipoOrden = "'" . $_SESSION["orden"]["TipoOrden"] . "'";
$TipoTarea = "'" . $_SESSION["orden"]["TipoTarea"] . "'";
$SistemaEmisor = "'" . $_SESSION["orden"]["SistemaEmisor"] . "'";
$TipoProducto = "'" . $_SESSION["orden"]["TipoProducto"] . "'";
$FechaHoraCreacion =  "'". date("Y-m-d H:i:s") . "'"; 
$usuario = "'" . $_SESSION["usuario"] . "'";
$FechaPrevista = "'" . date('Y-m-d', strtotime(substr($_SESSION["orden"]["FechaPrevista"],10, 4) . "-" . substr($_SESSION["orden"]["FechaPrevista"],5, 2) . "-" . substr($_SESSION["orden"]["FechaPrevista"],0, 2))) . "'";
$Equipo = "'" . $_SESSION["orden"]["Equipo"] . "'"; 
$NombreCliente = "'" . $_SESSION["orden"]["NombreCliente"] . "'";
$ApellidoCliente = "'" . $_SESSION["orden"]["ApellidoCliente"] . "'";
$Cedula = "'" . $_SESSION["orden"]["Cedula"] . "'";
$Telefono = "'" . $_SESSION["orden"]["Telefono"] . "'";
$Direccion = "'" . $_SESSION["orden"]["Direccion"]. "'";
$Localidad = "'" . $_SESSION["orden"]["Localidad"] . "'";
$Departamento = "'" . $_SESSION["orden"]["Departamento"] . "'";
$Estado = "'programada'";
$CodigoZona = "'" . $_SESSION["orden"]["CodigoZona"] . "'";
$Prioridad = "'0'";
$Horario = "'" . $_SESSION["orden"]["Horario"] . "'";
$Comentario = "'" . $_SESSION["orden"]["Comentario"] . "'";
$FuncionesRequeridas = "'" . $_SESSION["orden"]["FuncionesRequeridas"] . "'";

echo "se procedera a grabar la orden de trabajo con la sigueinte informacion:<br>";
echo "-----------------------------------------------------------------------<br><br>";

echo "Estado :                          " . $Estado . "<br>";
echo "Fecha de Generación :             " . $FechaHoraCreacion . "<br>";
echo "Usuario Generación :              " . $usuario . "<br>";
echo "Tipo de Orden :                   " . $TipoOrden . "<br>";
echo "Sistema Generador :               " . $SistemaEmisor . "<br>";
echo "Tipo de Tarea :                   " . $TipoTarea . "<br>";
echo "Producto :                        " . $TipoProducto . "<br>";
echo "Habilidades Requeridas :          " . $FuncionesRequeridas . "<br>";
echo "Nombre del Cliente :              " . $NombreCliente . "<br>";
echo "Apellido del Cliente :            " . $ApellidoCliente . "<br>";
echo "Cédula de Identidad del Cliente : " . $Cedula . "<br>";
echo "Télefono/Celular del Cliente :    " . $Telefono . "<br>";
echo "Departamento :                    " . $Departamento . "<br>";
echo "Localidad :                       " . $Localidad . "<br>";
echo "Direccion :                       " . $Direccion . "<br>";
echo "Codigo de Zona :                  " . $CodigoZona . "<br>";
echo "Prioridad :                       " . $Prioridad . "<br>";
echo "Fecha Prevista :                  " . $FechaPrevista . "<br>";
echo "Horario Preferido :               " . $Horario . "<br>";
echo "Comentario :                      " . $Comentario . "<br>";
echo "Equipo :                          " . $Equipo . "<br>";
echo "-----------------------------------------------------------------------<br><br>";

        $campos = array(
            "tipoorden",
            "tipotarea",
            "sistemaemisor",
            "tipoproducto",
            "fechahoracreacion",
            "usuariocreador",
            "fechaprevista",
            "equipo",
            "nombrecliente",
			"apellidocliente",
			"cedula",
			"telefono",
            "direccion",
            "localidad",
            "departamento",
            "estado",
            "codigozona",
            "prioridad",
			"horario",
			"comentario",
            "funcionesrequeridas");


        $valores = array(
						$TipoOrden,
						$TipoTarea,
						$SistemaEmisor,
						$TipoProducto,
						$FechaHoraCreacion,
						$usuario,
						$FechaPrevista,
						$Equipo,
						$NombreCliente,
						$ApellidoCliente,
						$Cedula,
						$Telefono,
						$Direccion,
						$Localidad,
						$Departamento,
						$Estado,
						$CodigoZona,
						$Prioridad,
						$Horario,
						$Comentario,
						$FuncionesRequeridas
						);
						
        $mensaje = "";
		$ordenGenerada = "";
		
        insertar_orden_de_trabajo($campos, $valores, $mensaje, $ordenGenerada);

		unset($_SESSION["orden"]);
		
		echo "<br><br>orden insertada : " . $ordenGenerada . "<br>";
		
		$_SESSION["mensajePasado"] = "DesplegarOrden";
		$_SESSION["scriptSiguiente"] = "../menucomercial.php";
		
		header("Location: ../velistarordenes/controladorDesplegarOrden.php?nroOT='" . $ordenGenerada . "'&siguienteScript='../menucomercial.php'");

?>