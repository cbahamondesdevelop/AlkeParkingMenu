import Foundation

class ManagerProductos {
    
    var prod:[Productos] = []
    
    func insertarProducto (pro:Productos) {
        prod.append(pro)
    }
    
    func consultarProducto (pro:Productos) -> String {
        
        var respuesta = ""
        
        prod.forEach { producto1 in
            if producto1.nombre == pro.nombre {
                respuesta = producto1.nombre
            }
        }
        
        return respuesta
    }
    
    func eliminarProducto(pro:Productos) {
        let uno = 1
        prod.remove(at: uno)
    }
}
