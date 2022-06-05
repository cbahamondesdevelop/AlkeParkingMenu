import UIKit

enum TipoLibro:String {
    case cienciaFiccion
    case drama
    case comedia
    case novela
}

class Libro {
    
    //MARK: Propiedades
    var nombre:String
    var precio:Float
    var tipoDeLibro:String
    //MARK: Inits
    init (nombre:String, precio:Float, tipoDeLibro:String) {
        self.nombre = nombre
        self.precio = precio
        self.tipoDeLibro = tipoDeLibro
    }
    
}

extension Libro {
    
    func getPrecio () -> Float {
        return precio
    }
}

class Biblioteca {
    //MARK: Propiedades
    var arregloLibros:[Libro] = []
    
    //MARK: Metodos
    
    func agregarLibro(libro1:Libro) {
        
        arregloLibros.append(libro1)
    }
    
    func eliminarLibro(numLibroEliminar:Int) {
        arregloLibros.remove(at: numLibroEliminar)
    }
    
    func listarLibros() {

        arregloLibros.forEach { libroAux in
            print(libroAux.nombre)
            print(libroAux.precio)
            print(libroAux.tipoDeLibro)
        }
    }
}

class Venta : Biblioteca {
    
    let IVA:Float = 19.0
    
    func calcularPrecioTotal(precioBruto:Float) -> Float {
        var respuesta:Float
        let valorIVA = (precioBruto * IVA) / 100
        respuesta = valorIVA + precioBruto
        return respuesta
    }
}

var objBiblioteca = Biblioteca()
var venderLibro = Venta()
let nuevoLibro1 = Libro(nombre: "Lord of the ring", precio: 20000, tipoDeLibro: TipoLibro.cienciaFiccion.rawValue)


venderLibro.agregarLibro(libro1: nuevoLibro1)
let precioTotal = venderLibro.calcularPrecioTotal(precioBruto: nuevoLibro1.getPrecio())

venderLibro.listarLibros()
print(precioTotal)

