<?php

	class Conexion{
		private $host;
		private $bd;
		private $user;
		private $pass;
		private $conexion;
		private $url;

		public function __construct(){

		}

		public function cargarValores(){
			$this->host="localhost";
			$this->bd="Policia";
			$this->user="postgres";
			$this->pass="101";
			$this->conexion="host='$this->host' dbname='$this->bd' 
							user='$this->user' password='$this->pass'";
		}
		public function conectar(){
			$this->cargarValores();
			$this->url=pg_connect($this->conexion) 
			or die("no se pudo conectar");
			return true;
		}
		public function desconectar(){
			pg_close($this->url);
		}
	}
	
?>