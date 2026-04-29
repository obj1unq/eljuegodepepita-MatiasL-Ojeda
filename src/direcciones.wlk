import nivel-1.*
import extras.*
object direccion {
    method move(personaje) {
        keyboard.up   ().onPressDo({ arr.mover(personaje) })
        keyboard.down ().onPressDo({ aba.mover(personaje) })
        keyboard.left ().onPressDo({ izq.mover(personaje) })
        keyboard.right().onPressDo({ der.mover(personaje) })
    }
	method moverEnYSi(condicion, y, personaje) {
		if (condicion){
			personaje.position(personaje.x(), y)
            personaje.consumirEnergia()
		}
	}
    method moverEnXSi(condicion, x, personaje) {
		if (condicion){
			personaje.position(x, personaje.y())
            personaje.consumirEnergia()
		}
	}
    method noHayMuroEn(x, y) = not (game.at(x,y) == muro1.position()) &&
                               not (game.at(x,y) == muro2.position()) &&
                               not (game.at(x,y) == muro3.position()) &&
                               not (game.at(x,y) == muro4.position())
}
object arr {
    method mover(personaje) {
        if (nivel1.dentroDeBordes(personaje, personaje.y() + 1) && personaje.tengoEnergia()) {
            direccion.moverEnYSi(direccion.noHayMuroEn(personaje.x(), personaje.y() + 1), personaje.y() + 1, personaje)
        }
    }
}
object der {
    method mover(personaje) {
        if (nivel1.dentroDeBordes(personaje, personaje.x() + 1) && personaje.tengoEnergia()){
            direccion.moverEnXSi(direccion.noHayMuroEn(personaje.x() + 1, personaje.y()), personaje.x() + 1, personaje)
        }
    }
}
object aba {
    method mover(personaje) {
        if (nivel1.dentroDeBordes(personaje, personaje.y() - 1) && personaje.tengoEnergia()){
            direccion.moverEnYSi(direccion.noHayMuroEn(personaje.x(), personaje.y() - 1), personaje.y() - 1, personaje)
        }
    }
}
object izq {
    method mover(personaje) {
        if (nivel1.dentroDeBordes(personaje, personaje.x() - 1) && personaje.tengoEnergia()){
            direccion.moverEnXSi(direccion.noHayMuroEn(personaje.x() - 1, personaje.y()), personaje.x() - 1, personaje)
        }
    }
}