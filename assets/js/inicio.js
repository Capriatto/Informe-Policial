(function(){
	
	var cabeceraTabla=document.getElementById("cabecera");
	var botonEmergencia=document.getElementById("irAbajo");


	var mostrarLineas=function(){
		var col_1=["Radio Patrullas","Accidentes de Transito","Bomberos",
					"PAC (Policia de Ayuda Ciudadana)","Unidad Op. de Tránsito",
					"Ambulancias de Emergencias"];
		var col_2=["110","157","119","120","116","165"];
		var tab=document.getElementById("tabEmergencias");
		var celdaTitulo=document.getElementsByTagName("tr")[0];
		if(celdaTitulo.className=="titulo"){
			celdaTitulo.className="";
			celdaTitulo.style.background="#FF0000";
			celdaTitulo.style.textAlign="center";
			celdaTitulo.style.fontWeight="bold";
			for(var i=0;i<col_1.length;i++){
				var fila=document.createElement("tr");
				fila.setAttribute("class", "filaEmergencias")
				var celda_1=document.createElement("td");
				celda_1.setAttribute("class", "nombreEmergencia");
				celda_1.setAttribute("align", "center")
				var textoCelda_1=document.createTextNode(col_1[i]);
				var celda_2=document.createElement("td");
				celda_2.setAttribute("class", "numeroEmergencia");
				var textoCelda_2=document.createTextNode(col_2[i]);

				celda_1.appendChild(textoCelda_1);
				fila.appendChild(celda_1);
				celda_2.appendChild(textoCelda_2);
				fila.appendChild(celda_2);
				tab.appendChild(fila);
			}
			desplazar();
		}else{
			celdaTitulo.className="titulo";
			celdaTitulo.style.background="#7D7D7D";
			for(var i=0;i<col_1.length;i++){
				tab.removeChild(document.getElementsByTagName("tr")[1]);
			}
		}
	}
	var validarFormulario=function(){
		var bandera=true;
		var formulario=document.loggin;
		for(var i=0;i<formulario.length;i++){
			if(formulario[i].type=="text" || 
				formulario[i].type=="password"){
				if(formulario[i].value==null || 
					formulario[i].value.length==0){
					bandera=false;
				}
			}
		}
		comprobar(bandera);
	}
	function inactivar(){
		return false;
	}
	//falta trabajar en la funcion aun...
	function comprobar(b){
		if(b){
			alert("ENVIO");
			document.loggin.submit();
		}
	}
	function desplazar(){
		window.scrollTo(0,document.body.scrollHeight);
	}
	/*deshacer el seleccionado de texto y menu con clic derecho*/
	document.oncontextmenu = inactivar;
	document.onselectstart=inactivar;

	document.loggin.addEventListener("submit", validarFormulario);
	cabeceraTabla.addEventListener("click", mostrarLineas);
	botonEmergencia.addEventListener("click", desplazar);
})();