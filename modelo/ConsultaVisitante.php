<?php
require_once 'Conexion.php';
$con=new Conexion();
$con->cargarValores();
$con->conectar();

$consulta=pg_query("SELECT numeromodulo,direccionmodulo,foto FROM modulo");
$fila=pg_fetch_row($consulta);
$imagen=pg_unescape_bytea($fila[2]);
echo $imagen;

?>