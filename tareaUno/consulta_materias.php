	<?php
include "includes/connection.php";
$idCursos=$_POST['curso'];
$query= "SELECT ec.id_estudiante, e.nombre_estudiante, e.codigo_estudiante FROM estudiante_curso AS ec, estudiantes AS e WHERE ec.id_estudiante=e.id_estudiantes AND ec.id_curso=".$idCursos;
$resultQuery= mysqli_query($con,$query);
while ($row = mysqli_fetch_array($resultQuery)) {
echo "
<form action='notas_estudiantes.php' method='post'>
<select name='estudiantes'>
<option value='".$row['id_estudiantes']."'>".$row['nombre_estudiante'] ."</option>
</select>"
." ".
$row["codigo_estudiante"]
." ".
"<select name='curso'>
<option value='".$idCursos."'></option>
</select>"
." ".
"<input type='submit' value='Consulta Las Notas'>
</form>
"
;
}
