import UIKit
import Darwin

protocol Parkable {
    var plate: String { get }
}

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

struct Parking {
    var vehicles: Set<Vehicle> = []
    let costoFijo5:Int = 5
    
    func calcularCostoEstacionamiento (horaIN:Int, horaOUT:Int, vehiculo:Vehicle, tarjetaDescuento:Bool) -> Int {
        
        if horaIN < horaOUT
        {
            let horaEvaluar = horaOUT - horaIN
            let vehiculoEvaluar:tipoVehiculo? = tipoVehiculo(rawValue: vehiculo.tipo)
            let costo = vehiculoEvaluar ?? tipoVehiculo.otro
            
            if tarjetaDescuento
            {
                var respuesta:Int = costo.costoPorVehiculo + (costoFijo5 * calcularTramo(pHoraEvaluar: horaEvaluar))
                let descuento = (respuesta * 15) / 100
                respuesta = respuesta - descuento
                return respuesta
            }
            else
            {
                let respuesta:Int = costo.costoPorVehiculo + (costoFijo5 * calcularTramo(pHoraEvaluar: horaEvaluar))
                return respuesta
            }
        }
        else
        {
            print("Debe ingresar hora de salida valida")
            return 0
        }
    }
    
    func listarVehiculosEstacionados() {
        
        vehicles.forEach { auto in
            print("\(auto.tipo) \(auto.plate) hora ingreso: \(auto.horaIngreso)")
        }
    }
    
    mutating func eliminarVehiculo() { //Debido a que salio del estaciomaniento
        //vehicles.remove(Vehicle)
    }
    
    mutating func insertarVehiculo(auto:Vehicle) {
        vehicles.insert(auto)
    }
}

struct Vehicle: Parkable, Hashable {
    let plate: String
    let tipo:String
    let horaIngreso:Int
    let horaSalida:Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate
    }
}

func calcularTramo(pHoraEvaluar:Int) -> Int {
    
    var respuesta:Int=0
    
    if pHoraEvaluar <= 200 {
        respuesta = 0
    }

    if pHoraEvaluar > 200 && pHoraEvaluar <= 215 {
        respuesta = 1
    }

    if pHoraEvaluar > 215 && pHoraEvaluar <= 230 {
        respuesta = 2
    }
    
    if pHoraEvaluar > 230 && pHoraEvaluar <= 245 {
        respuesta = 3
    }
    
    if pHoraEvaluar > 245 && pHoraEvaluar <= 260 {
        respuesta = 4
    }
    
    if pHoraEvaluar > 300 && pHoraEvaluar <= 315 {
        respuesta = 5
    }
    
    if pHoraEvaluar > 315 && pHoraEvaluar <= 330 {
        respuesta = 6
    }
    
    if pHoraEvaluar > 330 && pHoraEvaluar <= 345 {
        respuesta = 7
    }
    
    if pHoraEvaluar > 345 && pHoraEvaluar <= 360 {
        respuesta = 8
    }
    
    return respuesta
}

//print(calcularTramo(pHoraEvaluar: 2130-1800))
let auto1 = Vehicle(plate: "XXRR21", tipo: tipoVehiculo.auto.rawValue, horaIngreso: 1800, horaSalida: 1801)
let auto2 = Vehicle(plate: "AABB22", tipo: tipoVehiculo.moto.rawValue, horaIngreso: 1900, horaSalida: 2300)


var estacionamiento = Parking()

if estacionamiento.vehicles.count < 20 {
    estacionamiento.insertarVehiculo(auto: auto1)
    estacionamiento.insertarVehiculo(auto: auto2)
}
let n1  = estacionamiento.calcularCostoEstacionamiento(horaIN: auto2.horaIngreso, horaOUT: auto2.horaSalida, vehiculo: auto2, tarjetaDescuento: false)
estacionamiento.listarVehiculosEstacionados()
print("Valor estacionamiento :$" + String(n1))
//print()


