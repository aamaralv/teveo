<?php include_once ("seguridad/seguridad.php");
//se guarda el nombre del script actual para informalo al siguiente
$_SESSION["paginaAnterior"] = substr($_SERVER['SCRIPT_NAME'],strrpos($_SERVER['SCRIPT_NAME'],'/')+1);
$_SESSION["mensajePasado"] = "";

/*
echo "<pre>";
print_r($_SESSION);
echo "</pre>";
*/

?> 
<html> 
  <head> 
    <title>Menú</title>
  </head> 
  <body> 
  <h1 style="text-align:center;"><br>TEVEO</h1>
  <h1><br></h1>
    <table align="center" width="300" cellspacing="2" cellpadding="2" border="0">
      <tr> 
        <td align="left"><h1>Menú Inicial</h1></td> 
      </tr>
	  <tr> 
        <td><hr /></td> 
      </tr> 
	  <?php
	  if ($_SESSION["rol"] === '1')
	  {
		echo "<tr>"; 
        echo '<td align="left"><a href="menuempleados.php">Menú gestión de Empleados</a></td>'; 
		echo "</tr>";
	  }
	  if ($_SESSION["rol"] === '2')
	  {
		echo "<tr>"; 
        echo '<td align="left"><a href="menucomercial.php">Menú gestión Comercial</a></td>'; 
		echo "</tr>";
	  }
	  if ($_SESSION["rol"] === '3')
	  {
		echo "<tr>"; 
        echo '<td align="left"><a href="menuoperaciones.php">Menú gestión de Operaciones</a></td>'; 
		echo "</tr>";
	  }
	  if ($_SESSION["rol"] === '4')
	  {
		echo "<tr>"; 
        echo '<td align="left"><a href="menuequipos.php">Menú gestión OT por Equipos</a></td>'; 
		echo "</tr>";
	  }	  
	  ?>
	  <tr> 
        <td><hr /><br><br></td> 
      </tr>	  
      <tr> 
        <td align="center"><a href="salir.php">Salir</a></td> 
      </tr> 
    </table>
  </body> 
</html> 
	