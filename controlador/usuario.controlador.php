<?php

	class UsuarioControlador{

		public function __CONSTRUCT(){

		}
	
		public function Index(){
			require_once 'vista/usuario/header.php';
			require_once 'vista/usuario/bienvenida.php';
			require_once 'vista/piePagina.php';
		}
		public function verNoticias(){
			require_once 'vista/usuario/header.php';
			require_once 'vista/usuario/noticias.php';
			require_once 'vista/piePagina.php';
		}
	}
?>	