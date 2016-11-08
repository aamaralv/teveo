<?php include_once ("seguridad/seguridad.php");
//se guarda el nombre del script actual para informalo al siguiente
$_SESSION["paginaAnterior"] = substr($_SERVER['SCRIPT_NAME'],strrpos($_SERVER['SCRIPT_NAME'],'/')+1);
$_SESSION["mensajePasado"] = "";

/*echo "<pre>";
print_r($_SESSION);
echo "</pre>";*/
?> 
<html> 
  <head> 
    <title>Men�</title>
  </head> 
  <body> 
  <h1 style="text-align:center;"><br>TEVEO</h1>
  <h1><br></h1>
    <table align="center" width="200" cellspacing="2" cellpadding="2" border="0">
      <tr> 
        <td align="left"><h1>Menú Inicial</h1></td> 
      </tr>
	  <tr> 
        <td><hr /></td> 
      </tr> 
	  <?php
          switch ($_SESSION["rol"]) {
            case "1":
		echo "<tr>"; 
                echo '<td align="left"><a href="menuempleados.php">Menu gestion de empleados</a></td>'; 
		echo "</tr>";
                echo "<tr>"; 
                echo '<td align="left"><a href="menucomercial.php">Menu area comercial</a></td>'; 
		echo "</tr>";
                echo "<tr>"; 
                echo '<td align="left"><a href="menuoperaciones.php">Menu area operaciones</a></td>'; 
		echo "</tr>";
                echo "<tr>"; 
                echo '<td align="left"><a href="menusoporte.php">Menu area soporte</a></td>'; 
		echo "</tr>";
            break;
            case "2":
                echo "<tr>"; 
                echo '<td align="left"><a href="menucomercial.php">Menu area comercial</a></td>'; 
		echo "</tr>";
            break;
            case "3":
                echo "<tr>"; 
                echo '<td align="left"><a href="menuoperaciones.php">Menu area operaciones</a></td>'; 
		echo "</tr>";
            break;
            case "4":
                echo "<tr>"; 
                echo '<td align="left"><a href="menuoperaciones.php">Menu area operaciones</a></td>'; 
		echo "</tr>";
            break;
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
	