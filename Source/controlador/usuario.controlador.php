<?php

	class UsuarioControlador{

		public function __CONSTRUCT(){

		}
	
		public function Index(){
			require_once 'Source/vista/usuario/header.php';
			require_once 'Source/vista/usuario/bienvenida.php';
			require_once 'Source/vista/piePagina.php';
		}
		public function verNoticias(){
			require_once 'Source/vista/usuario/header.php';
			require_once 'Source/vista/usuario/noticias.php';
			require_once 'Source/vista/piePagina.php';
		}
	}
?>	