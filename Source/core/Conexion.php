<?php
class Conexion extends PDO{
	private $host;
	private $usuario;
	private $contrasenia;
	private $bd;
	private $puerto;
	private $manejador;
	private $conexion;
	public function __construct(){
		require_once "../config/baseDeDatos.php";
		$this->host=HOST;
		$this->usuario=USUARIO;
		$this->contrasenia=CONTRASENIA;
		$this->bd=BD;
		$this->puerto=PUERTO;
		
		$this->conectar();
	}
	private final function conectar(){
		$con=null;
		echo "1";
		try{
			if(is_array(PDO::getAvailableDrivers())){
				echo "2";
				if( in_array( "pgsql",PDO::getAvailableDrivers() ) ){
					echo "3";
					$con=new PDO("pgsql:host=$this->host;port=$this->puerto;dbname=$this->bd;
								user=$this->usuario; password=$this->contrasenia");
					$this->setManejador('pgsql');
				}else{
					throw new PDOException("No se puede establecer conexion");
				}
			}
		}catch(PDOException $e){
			echo $e->getMessage();
		}
		$this->setConexion($con);
	}
	private final function setConexion($conexion){
		$this->conexion=$conexion;
	}
	private final function getConexion(){
		return $this->conexion;
	}
	private final function getManejador(){
		return $this->manejador;
	}
	private final function cerrarConexion(){
		$this->setConexion(null);
	}
	private final function setManejador($manejador){
		$this->manejador=$manejador;
	}

}
?>