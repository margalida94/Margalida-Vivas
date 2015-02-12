<?php
//Datos de Conexion//
$host="localhost";
$user="root";
$password="";
$db="basededatos";// nombre de la base de datos 
//se creo una variable conexión//
$con=mysqli_connect($host,$user,$password)or die("problemas al conectar");
//se selecciona la base de datos//
mysqli_select_db($con,$db)or die("probelmas al seleccionar la base de datos");
//Para hacer cualquier consulta, se crea un nuevo archivo php y se pone la siguiente sentencia
//para consulta : include 'connection.php'
?>