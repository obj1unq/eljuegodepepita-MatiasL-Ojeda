import src.direcciones.*
import wollok.game.*
import extras.*
import comidas.*
object pepita {
	var energia  = 200
	var position = game.at(3, 3)

	method image() = 
	if (self.position() == silvestre.position() || energia <= 0) {
		return "pepita-gris.png"
	} else {
		return "pepita.png"
	}
	method energia()  = energia
	method y() 		  = position.y()
	method x() 		  = position.x()
	method position() = position

	method position(x, y) {
		position = game.at(x, y)
	}
	method init() {
		self.image()
		self.position(3,3)
		energia = 200
		self.volar(0)
	}
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida) 
	}
	method volar(kms) {
		energia = energia - 10 - kms 
	}
	method energia(cantidad) {
		energia -= cantidad
	}
	method gravedad() {
        if (self.y() > 0  && energia > 9 && direccion.noHayMuroEn(self.x(), self.y()-1)) {
			position = position.down(1)
			energia -= 9
		}
	}
}