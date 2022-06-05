import Foundation
import Darwin

struct Vehicle: Parkable, Hashable {
    
    var plate: String
    var tipo:String
    var horaIngreso:Int
    var horaSalida:Int
    var montoPagado:Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate //Si las 2 placas son iguales, significara que el elemento es igual al otro
    }

}
