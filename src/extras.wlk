import wollok.game.*
import pepita.*
import direcciones.*

object silvestre {
    method image() = ("silvestre.png") 
    method position() =
        if (pepita.x() < 3) {
            game.at(3, 0)
        } else {
            game.at(pepita.x(), 0)
        }    
}
object nido {
    method image() = ("nido.png")
    method position() = game.at(10, 9)
}
object muro1 {
    method image()    = ("muro.png") 
    method position() = game.at(5, 8)
}
object muro2 {
    method image()    = ("muro.png") 
    method position() = game.at(0, 0)
}
object muro3 {
    method image()    = ("muro.png") 
    method position() = game.at(1, 0)
}
object muro4 {
    method image()    = ("muro.png") 
    method position() = game.at(2, 0)
}
