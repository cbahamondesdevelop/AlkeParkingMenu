import Foundation

class Productos {
    //MARK: Atributos
    let nombre:String
    let tipo:String
    let marca:String
    let precio:Int
    let descripcion:String
    //MARK: Constructor
    init (nombre:String, tipo:String, marca:String, precio:Int, descripcion:String) {
        self.nombre = nombre
        self.tipo = tipo
        self.marca = marca
        self.precio = precio
        self.descripcion = descripcion
    }
}
