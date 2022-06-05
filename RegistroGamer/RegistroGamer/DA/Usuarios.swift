import Foundation

class Usuarios {
    let nombre:String
    let apellido:String
    let nomUsuario:String
    let password:String
    
    //init (nombre:String="", apellido:String="", nomUsuario:String="", password:String="") {
    init (nombre:String, apellido:String, nomUsuario:String, password:String) {
        self.nombre = nombre
        self.apellido = apellido
        self.nomUsuario = nomUsuario
        self.password = password
    }
}
