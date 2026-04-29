import pepita.*
import comidas.*
import extras.*
import wollok.game.*
import direcciones.*

object nivel1 {
    method init() {
        pepita.init()
        game.clear()

        direccion.move(pepita)
        keyboard.x().onPressDo({ self.init() })
        game.onCollideDo(manzana,   { alguien => alguien.comer(manzana) })
        game.onCollideDo(silvestre, {alguien => game.say(alguien, "¡PERDÍ!") alguien.energia(alguien.energia()) game.onTick(2000, "mori", {self.init() })})
        game.onCollideDo(nido,      {alguien => game.say(alguien, "¡GANE!")  alguien.energia(alguien.energia()) game.onTick(2000, "gane", {self.init() })})
        game.onTick(800, "gravedad", {pepita.gravedad()})   
        game.addVisual(silvestre)
        game.addVisual(pepita)
        game.addVisual(manzana)
        game.addVisual(nido)
        game.addVisual(muro1)
        game.addVisual(muro2)
        game.addVisual(muro3)
        game.addVisual(muro4)
    }
    method dentroDeBordes(personaje, p) = (personaje.y() <= game.height() - 1 && 
                                           personaje.x() <= game.height() - 1 &&
                                           personaje.y() >= 0                 &&
                                           personaje.x() >= 0)                &&
                                           not (p == -1 || p == game.height())
}
