import cosas.*

object camion {
	const property cosas = []
	var cantidadBultos = 0

	method cargar(unaCosa) {
		if( unaCosa.peso() >= 2.500){
			unaCosa.error("No se puede agregar, supera el maximo de 2.5 toneladas")
		} else{
		cosas.add(unaCosa)
		}
	}
	method descargar(unaCosa) {
		if ( !cosas.contains(unaCosa) ){
			cosas.error("No está cargado en el camion, no lo podes sacar")
		} else {
		cosas.remove(unaCosa)
		}
	}
	method pesoTotal() {
	  return cosas.peso().sum() + 1000
	}
	method excedidodDePeso() {
	  return self.pesoTotal() > 2500
	}
	method objetosPeligrosos(nivel) {
	  // retorna todos los objetos cargados que superan el nivel de peligrosidad indicados por el valor del parametro
	  return cosas.filter()  { cosa => cosa.peligrosidad() > nivel }       
	}
	method objetosPeligrososQue(unaCosa) {
	  // retorna todos los objetos cargados que superan el nivel de peligrosidad indicados por el valor del parametro
	  return cosas.filter()  { cosa => cosa.peligrosidad() > unaCosa.peligrosidad() }       
	}
	method puedeCircularEnRuta(_nivelMaximoPeligrosidad) {
	  return cosas.any({cosa => cosa.peligrosidad() < _nivelMaximoPeligrosidad})
	}


	// parte de agregados al cambion

	method tieneAlgoQuePesaEntre(min,max) {
		return cosas.any({cosa => cosa.peso() >= min and cosa.peso() < max})
	}  
	method cosaMasPesada() = cosas.peso().max()
	method totalBultos() {
		return self.calcularBultos()
	} 
	method calcularBultos() {

		if( cosas.contains(knightRider) and cosas.contains(arenaAGranel) and cosas.contains(residuosRadioactivos) ){
			cantidadBultos += 1 
		} else if (cosas.contains(bumblebee) and cosas.contains(embalajeDeSeguridad)){
			cantidadBultos += 1 
		} else if ( cosas.contains( bateriaAntiaerea) and cosas.bateriaAntiaerea().estaConMisiles() ){
			cantidadBultos += 2 
		} else if ( cosas.contains( bateriaAntiaerea) and not cosas.bateriaAntiaerea().estaConMisiles() ){
			cantidadBultos += 1 
		} else if ( cosas.contains( paqueteDeLadrillos)){
			cantidadBultos += cosas.cantidad_ladrillos_paquete() / 100  
		}

	} 
	method pesos() = cosas.peso().map()
}

