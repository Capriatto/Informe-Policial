(function(){
	
	var cabeceraTabla=document.getElementById("cabecera");
	
	cabeceraTabla.addEventListener("click",function(){
		
		var col_1=["Radio Patrullas","Accidentes de Transito","Bomberos",
					"PAC (Policia de Ayuda Ciudadana)","Unidad Op. de Tránsito",
					"Ambulancias de Emergencias"];
		var col_2=["110","157","119","120","116","165"];
		var tab=document.getElementById("tabEmergencias");
		for(var i=0;i<col_1.length;i++){
			var fila=document.createElement("tr");
			var celda_1=document.createElement("td");
			celda_1.setAttribute("class", "nombreEmergencia");
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
	})
})();