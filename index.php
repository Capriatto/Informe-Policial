<?php
	$controlador="usuario";
	if(!isset($_REQUEST["c"])){
		require_once "controlador/$controlador.controlador.php";
		$controlador=ucwords($controlador).'Controlador';
		$controlador=new $controlador;
		$controlador->Index();
	}else{
		switch ($_REQUEST["c"]) {
			case '1':
				require_once "controlador/$controlador.controlador.php";
				$controlador=ucwords($controlador).'Controlador';
				$controlador=new $controlador;
				$controlador->verNoticias();
				break;
			
			default:
				# code...
				break;
		}
	}
?>