import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method pesoTotal() {
	  return cosas.sum()
	}
	method excedidodDePeso() {
	  return self.pesoTotal() > 2500
	}
	method objetosPeligrosos(nivel) {
	  // retorna todos los objetos cargados que superan el nivel de peligrosidad indicados por el valor del parametro
	  return 
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	  return
	}
}
