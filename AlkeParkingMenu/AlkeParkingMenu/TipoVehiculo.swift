import Foundation
import Darwin

enum tipoVehiculo:String {
    case auto
    case moto
    case minibus
    case bus
    case otro
    
    var costoPorVehiculo:Int {
        switch self {
        case .auto: return 20
        case .moto: return 15
        case .minibus: return 25
        case .bus: return 30
        case .otro: return 0
        }
    }
}
