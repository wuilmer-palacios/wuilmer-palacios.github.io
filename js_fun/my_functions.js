// FUNCIONES DEL MENU ¡¡¡¡CUIDADO!!!!
// FUNCIONES DEL MENU ¡¡¡¡CUIDADO!!!!
//INICIO - INICIO - INICIO - INICIO 
function menu(){
	$("#sidebar").toggleClass("active");
	document.getElementById('capa').classList.toggle('capa-capa');
}
function despliegaSubMenu1(){
	var valor=$("#children1").css('display');
	if (valor=='none') {
		document.getElementById("children1").style.display='block';
		document.getElementById("subMenu1").classList.toggle('seleccion');
	}
	else{
		document.getElementById("children1").style.display='none';
		document.getElementById("subMenu1").classList.toggle('seleccion');
	}
	
}
function despliegaSubMenu2(){
	var valor=$("#children2").css('display');
	if (valor=='none') {
		document.getElementById("children2").style.display='block';
		document.getElementById("subMenu2").classList.toggle('seleccion');
	}
	else{
		document.getElementById("children2").style.display='none';
		document.getElementById("subMenu2").classList.toggle('seleccion');
	}
	
}
function despliegaSubMenu3(){
	var valor=$("#children3").css('display');
	if (valor=='none') {
		document.getElementById("children3").style.display='block';
		document.getElementById("subMenu3").classList.toggle('seleccion');
	}
	else{
		document.getElementById("children3").style.display='none';
		document.getElementById("subMenu3").classList.toggle('seleccion');
	}
	
}
// FIN - FIN - FIN - FIN - FIN
// FUNCIONES DEL MENU ¡¡¡¡CUIDADO!!!!
// FUNCIONES DEL MENU ¡¡¡¡CUIDADO!!!!

function validaNombrePlan(){
	var nombrePlan=$("#nombrePlan").val();
	if (nombrePlan!=="") {
		$.ajax({
			url:'class/validaNombre.php',
			type:'POST',
			data:{sendNombrePlan:nombrePlan},
			success: function(data){
				var valor=data;

				if (valor>=1) {
					$("#label-control-danger").css("display","block");
					$("#boton-registrar").prop("disabled",true);
					
				}
				else{
					$("#label-control-danger").css("display","none");
					$("#boton-registrar").prop("disabled",false);
					$('#nombrePlan').toggleClass('form-control-success');

				}
			}
		})
	}
}
function validaFechaInicio(){

	var fechafin=$("#fechaFinal").val().split('-');
	var fechaFinal=(fechafin[1] + '/' + fechafin[2] + '/' + fechafin[0]);
	var tercera = Date.parse(fechaFinal);

	var fechaini=$("#fechaInicio").val().split('-');
	var fecha=new Date();
	var hoy=((fecha.getMonth()+1)+"/"+fecha.getDate()+"/"+fecha.getFullYear());

	fechaInicio=(fechaini[1] + '/' + fechaini[2] + '/' + fechaini[0]);

	var primera = Date.parse(fechaInicio); //01 de Octubre del 2013
	var segunda = Date.parse(hoy); //03 de Octubre del 2013
	 
	if (primera > segunda) {
		$("#label-inicio").css("display","none");
		$("#boton-registrar").prop("disabled",false);
		$("#fechaFinal").val('');
		$('#fechaInicio').addClass('form-control-success');

	}
	else{
		$("#label-inicio").css("display","block");
		$("#boton-registrar").prop("disabled",true);
	}
		
	
}
function validaFechaFinal(){

	var fechaini=$("#fechaInicio").val().split('-');
	var fechaInicio=(fechaini[1] + '/' + fechaini[2] + '/' + fechaini[0]);

	var fechafin=$("#fechaFinal").val().split('-');
	var fechaFinal=(fechafin[1] + '/' + fechafin[2] + '/' + fechafin[0]);

	var primera = Date.parse(fechaInicio);
	var segunda = Date.parse(fechaFinal);
	 
	if (primera >= segunda) {
		$("#label-final").css("display","block");
		$("#boton-registrar").prop("disabled",true);
		$('#fechaFinal').addClass('form-control-success');
	}
	else{
		$("#label-final").css("display","none");
		$("#boton-registrar").prop("disabled",false);
	}
}

function desactivarDanger(){
	$('#responsable').addClass('form-control-success');
}