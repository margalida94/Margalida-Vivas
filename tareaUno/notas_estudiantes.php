<?php
include "includes/connection.php";
$idCursos=$_POST['curso'];
$idEstudiante=$_POST['estudiantes'];
$query= "SELECT * FROM estudiantes
INNER JOIN nota_estudiante ON estudiantes.id_estudiantes = nota_estudiante.id_estudiante
INNER JOIN nota ON nota.id_nota = nota_estudiante.id_nota
INNER JOIN curso ON curso.id_curso = nota_estudiante.id_curso WHERE curso.id_curso=$idCursos AND estudiantes.id_estudiantes=$idEstudiante";
$resultQuery= mysqli_query($con,$query);


?>
<!DOCTYPE html>
<html>
<head>
<title>Notas del Estudiante</title>
</head>
<body>
<table border="1">
<tr>
<td> Nombre de la Nota </td>
<td> Nota </td>
<td> Porcentaje Nota</td>
<td> Calculo </td>
</tr>
<?php
$incr=0;
$nombreEstudiante;
while($row= mysqli_fetch_array($resultQuery)){
$nombre=$row['nombre_estudiante'];
$nombreCurso=$row['nombre_curso'];
echo"
<tr>
<td>".$row['nombre']."</td>
<td>".$row['valor']."</td>
<td>".$row['porcentaje']."</td>
<td>".$row['valor'] * $row['porcentaje']."</td>
</tr>
";
$incr++;
$arregloNotas[$incr]=$row['valor']*$row['porcentaje'];
}
?>
</table>
<?php
echo $nombreCurso.":";
if($idCursos==2){
echo $arregloNotas[1]+$arregloNotas[2];
} 
echo "<br>";
echo $nombre;
?>
</body>
</html>
