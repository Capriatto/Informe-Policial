<?php
	$controlador="usuario";
	if(!isset($_REQUEST["c"])){
		require_once 'controlador/$controlador.controlador.php';
		$controlador=ucwords($controlador).'Controlador';
		$controlador=new $controlador;
		$controlador->Index();
	}
?>