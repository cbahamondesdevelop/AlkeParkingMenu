import Foundation
import Darwin

protocol Parkable {
    
    var plate: String { get set }
    //var tipo:String { get set }
    var tipo:String { get }
    var horaIngreso:Int { get set }
    var horaSalida:Int { get set }
    var montoPagado:Int { get set }
}
