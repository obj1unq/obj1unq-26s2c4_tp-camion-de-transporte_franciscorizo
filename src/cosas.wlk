object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}
object paqueteDeLadrillos {
	var property cantidad_ladrillos_paquete = null

  
  method pesoPorLadrillo() = 2 
  method pesoRefuerzo() = 10
  // Si el paquete tiene hasta 1000 ladrillos, se utiliza un refuerzo cada 100 ladrillos. Si tiene más ladrillos se debe utilizar un refuerzo cada 50 ladrillos. 
  method pesoPaquete() {
	return cantidad_ladrillos_paquete * self.pesoPorLadrillo()
  }
  method calcularPeso() {
	return if ( cantidad_ladrillos_paquete > 1000 ) { self.pesoPaquete()  } 
  }
  method calcularRefuerzos() {
	if ( cantidad_ladrillos_paquete < 1000 ){
		return self.pesoPaquete() / 100 
	} else {
		return self.pesoPaquete() / 50
	}
  } 
  method peligrosidad() = 50 - self.calcularRefuerzos() 
}
object arenaAGranel {
	var peso = null
	method peligrosidad() = 1 
}
object bateriaAntiaerea {
	var estaConMisiles = true
	method peso(){
	 return if ( self.estaConMisiles() ) {300} else {200} 
	}
	method estaConMisiles() = estaConMisiles 
	method peligrosidad() {
		return if ( self.estaConMisiles() ) {100} else 0 
	} 
}

object contenedorPortuario {
	var cosas = []
	method peso() = 100 + cosas.peso().sum()
	method peligrosidad() {
		return if ( self.contieneCosas() ) {cosas.peligrosidad().max()} else {0}
	}
	method contieneCosas() {
		return !cosas.isEmpty()
	}
}
object residuosRadioactivos {
	var peso = null 
	method peso() = peso
	method peligrosidad() = 200   
}
object embalajeDeSeguridad {
	var cosa = null 
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2   
}