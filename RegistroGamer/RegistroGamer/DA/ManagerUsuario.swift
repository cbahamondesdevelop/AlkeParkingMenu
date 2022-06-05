import Foundation

class ManagerUsuario {
    
    var personas:[Usuarios] = []
    
    func insertarUsuario (per:Usuarios) {
        personas.append(per)
    }
    
    func consultarUsuario (per:Usuarios) -> String {
        
        var respuesta = ""
        
        personas.forEach { persona1 in
            if persona1.nomUsuario == per.nomUsuario {
                respuesta = persona1.nomUsuario
            }
        }
        
        return respuesta
    }
    
    func eliminarUsuario(per:Usuarios) {
        let uno = 1
        personas.remove(at: uno)
    }
}
