class Plaga{
	var property poblacion
	method puedeTransmitir()=poblacion>=10
}
	
class Hogar inherits Barrios{
	var property nivelDeMugre
	var property confort
	method esBueno()=nivelDeMugre/2<=confort
	method ataqueDePlaga(plaga){nivelDeMugre+=plaga.nivelDeDanio()}
}
class Huerta inherits Barrios{
	var property capacidadDeProduccion
	var property nivel
	method esBueno()=capacidadDeProduccion>nivel
	method ataqueDePlaga(plaga){
		if(plaga.transmiteEnfermedades()){
			capacidadDeProduccion-= 10
		}
		capacidadDeProduccion-= plaga.nivelDeDanio()*0.1
	}
}
class Mascota inherits Barrios{
	var property nivelDeSalud
	method esBueno()=nivelDeSalud>250
	method ataqueDePlaga(plaga){
		if(plaga.transmiteEnfermedades()){
			nivelDeSalud-=plaga.nivelDeDanio()
		}
	}
}
class Barrios{
	const elementos=[]
	method aniadirElemento(elem){elementos.add(elem)}
	method esCopado()=elementos.filter({el=>el.esBueno()}).size() > elementos.filter({el=>!el.esBueno()}).size()
}
class Cucaracha inherits Plaga{
	var property pesoPromedio
	method nivelDeDanio()=poblacion/2
	method transmiteEnfermedades()=self.puedeTransmitir() and pesoPromedio>=10
	method atacar(elem){
		elem.ataqueDePlaga(self)
		self.efectosDelAtaque()
	}
	method efectosDelAtaque(){
		poblacion+=poblacion*0.1
		pesoPromedio+=2
	}
}
class Pulgas inherits Plaga{
	method nivelDeDanio()= poblacion*2
	method transmiteEnfermedades()=self.puedeTransmitir()
	method atacar(elem){
		elem.ataqueDePlaga(self)
		self.efectosDelAtaque()
	}
	method efectosDelAtaque(){
		poblacion+=poblacion*0.1	
	}
}
class Garrapatas inherits Plaga{
	method nivelDeDanio()= poblacion*2
	method transmiteEnfermedades()=self.puedeTransmitir()
	method atacar(elem){
		elem.ataqueDePlaga(self)
		self.efectosDelAtaque()
	}
	method efectosDelAtaque(){
		poblacion+=poblacion*0.2
	}
}
class Mosquitos inherits Plaga{
	method nivelDeDanio()= poblacion
	method transmiteEnfermedades()= self.puedeTransmitir() and poblacion % 3 == 0
	method atacar(elem){
		elem.ataqueDePlaga(self)
		self.efectosDelAtaque()
	}
	method efectosDelAtaque(){
		poblacion+=poblacion*0.1
	}
}
