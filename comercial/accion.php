<?php
include ("../seguridad/seguridad.php");
include ("../persistencia/conexion.php");
include ("../persistencia/funcionesBD.php");
//conecto con la base de datos
$conexion = conectarBD($bdhost, $bduser, $bdpass);						 
//selecciono la BBDD
establecerBD($conexion, $bdbase);

// se resetea el mensaje de sesion pasado entre scripts
$_SESSION["mensajePasado"] = "";

if (isset($_POST["cancelar"])){
    header("Location: ../menu.php");
}
else
{
   echo "Boton confirmar: " . $_POST["confirmar"] . "<br>";
   echo "Boton cancelar: " . $_POST["cancelar"] . "<br>"; 
   echo "TipoOrden :" . $_SESSION["orden"]["TipoOrden"] . "<br>";
   echo "TipoTarea :" . $_SESSION["orden"]["TipoTarea"] . "<br>";
   echo "SistemaEmisor :" . $_SESSION["orden"]["SistemaEmisor"] . "<br>";

   $_SESSION["orden"]["TipoProducto"] = $_POST["producto"];
   echo '$_SESSION["orden"]["TipoProducto"] :' . $_SESSION["orden"]["TipoProducto"] . "<br>"; 


   if (obtenerAplicaHabilidadesDelProducto($conexion, $_SESSION["orden"]["TipoTarea"]))
       $_SESSION["orden"]["FuncionesRequeridas"] = obtenerHabilidadesTipoProducto($conexion, $_POST["producto"], obtenerDescripcionTipoTarea($conexion, $_SESSION["orden"]["TipoTarea"]));
   else
       $_SESSION["orden"]["FuncionesRequeridas"] = 1;


   echo " funcionalidades requeridas recuperadas de bd : " . $_SESSION["orden"]["FuncionesRequeridas"] . "<br>";
   echo "FuncionesRequeridas :" . $_POST["habilidades"] . "<br>";


		 $_SESSION["orden"]["NombreCliente"] = $_POST["nombre"];
		 $_SESSION["orden"]["ApellidoCliente"] = $_POST["apellido"];
		 $_SESSION["orden"]["Cedula"] = $_POST["ci"];
		 $_SESSION["orden"]["Telefono"] = $_POST["telefono"];
                 if ($_SESSION["orden"]["Departamento"] != $_POST["departamento"])
                 {
                     $_SESSION["orden"]["Departamento"] = $_POST["departamento"];
                     $_SESSION["orden"]["Localidad"] = "";
                 }
                 else
                 {
                     $_SESSION["orden"]["Localidad"] = $_POST["localidad"];
                 }
		 $_SESSION["orden"]["Direccion"] = $_POST["direccion"];
		 $_SESSION["orden"]["Horario"] = $_POST["horario"];
		 $_SESSION["orden"]["Comentario"] = $_POST["comentario"];
echo "NombreCliente :" .  $_SESSION["orden"]["NombreCliente"] . "<br>";
echo "ApellidoCliente :" .  $_SESSION["orden"]["ApellidoCliente"] . "<br>";
echo "Cedula :" . $_SESSION["orden"]["Cedula"] . "<br>";
echo "Telefono :" . $_SESSION["orden"]["Telefono"] . "<br>";
echo "Departamento :" . $_SESSION["orden"]["Departamento"] . "<br>";
echo "Localidad :" . $_SESSION["orden"]["Localidad"] . "<br>"; 
echo "Direccion :" . $_SESSION["orden"]["Direccion"] . "<br>";
echo "FechaPrevista :" . $_POST["fechaPrevista"] . "<br>";
echo "Equipo :" . $_POST["equipo"] . "<br>";
echo "Horario :" . $_SESSION["orden"]["Horario"] . "<br>";
echo "Comentario :" .  $_SESSION["orden"]["Comentario"] . "<br>";


// proceso de validacion

$scriptSiguiente = "GenerarOrdenDeTrabajoComercial.php";

if (isset($_POST["confirmar"]))
{
if ($_SESSION["orden"]["TipoProducto"] != "")

     if ($_SESSION["orden"]["ApellidoCliente"] != "")

          if ($_SESSION["orden"]["Cedula"] != "")

               if ($_SESSION["orden"]["Telefono"] != "")

                    if ($_SESSION["orden"]["Departamento"] != "")

                         if ($_SESSION["orden"]["Localidad"] != "")

                              if ($_SESSION["orden"]["Direccion"] != "")

                              {
                                  
                                  // se cumplen todas las condiciones para poder programar la orden.
                                  $_SESSION["ver"] = 7;
		                  $_SESSION["orden"]["CodigoZona"] = "";
		                  $_SESSION["orden"]["FechaPrevista"] = "";
		                  $_SESSION["orden"]["Equipo"] = "";
		                  $_SESSION["orden"]["Horario"] = "3";
		                  $_SESSION["orden"]["Comentario"] = "";

							// se carga un listado de equipos que pueden actuar en la zona y
							// que por sus habilidades pueden ejecutar la orden de trabajo
							//armado de la sentencia SQL para cargar datos
							$tabla = "equipo";
							$campos = "codigodeequipo, habilidades";
							$criterios = "codigozona = '" . $_SESSION["orden"]["Localidad"] .  "'";
echo "Criterio : $criterios <br>";
echo "Campos : $campos <br>";
echo "tabla : $tabla <br>"; 
							//Ejecuto la sentencia
							$tablars = consultarEnBD($conexion, $tabla, $campos, $criterios);
							$cantElem = sizeof($tablars);
                                                        
                                                        $listaEquipos = array();
echo "tablars<br><br>";
print_r($tablars);
echo "<br><br>Fin tablars<br>";
                                                        for ($e = 0; $e < $cantElem; $e++)
                                                            if (is_int($tablars[$e]["habilidades"] / $_SESSION["orden"]["FuncionesRequeridas"]))
                                                                $listaEquipos[] = $tablars[$e]["codigodeequipo"];
                                                         $_SESSION["listaEquipos"] = $listaEquipos;
echo "Listado de equipos que pueden realizar la orden : ";
print_r($_SESSION["listaEquipos"]);
echo "<br><br>";                               

                                  $scriptSiguiente = "programacion.php";
                                  
                              }
                              else
                                  $_SESSION["mensajePasado"] = "DEBE  INGRESAR  LA  DIRECCIÓN"; 

                         else 
                             $_SESSION["mensajePasado"] = "DEBE  INGRESAR  LOCALIDAD  DE  LA  DIRECCIÓN";    
    
                    else 
                        $_SESSION["mensajePasado"] = "DEBE  INGRESAR  DEPARTAMENTO  DE  LA  DIRECCIÓN";    

               else 
                   $_SESSION["mensajePasado"] = "DEBE  INGRESAR TELEFONO  DEL  CLIENTE";
    
          else 
              $_SESSION["mensajePasado"] = "DEBE  INGRESAR  CÉDULA  DEL  CLIENTE";
    
     else 
         $_SESSION["mensajePasado"] = "DEBE  INGRESAR  APELLIDO  DEL  CLIENTE";
    
else 
    $_SESSION["mensajePasado"] = "DEBE  ELEGIR  UN  PRODUCTO";

}

echo "a script siguiente : Location: $scriptSiguiente<br>";
header("Location: $scriptSiguiente");
}

?>									