import Foundation
import Darwin

struct Parking {
    var vehicles: Set<Vehicle> = []
    var autosRetirados:[Vehicle] = []
    let costoFijo5:Int = 5
    var cantRetiradosMontoAcumulado:(Int,Int) = (0,0)
    
    func calcularCostoEstacionamiento (horaIN:Int, horaOUT:Int, vehiculo:Vehicle, discountCard:Bool) -> Int {
        
        if horaIN < horaOUT && horaOUT < 2400 && horaIN >= 800
        {
            let horaEvaluar = horaOUT - horaIN
            let vehiculoEvaluar:tipoVehiculo? = tipoVehiculo(rawValue: vehiculo.tipo)
            let costo = vehiculoEvaluar ?? tipoVehiculo.otro
            
            if discountCard
            {
                var respuesta:Int = costo.costoPorVehiculo + calcularTramo(pHoraEvaluar: horaEvaluar)
                let descuento = (respuesta * 15) / 100
                respuesta = respuesta - descuento
                return respuesta
            }
            else
            {
                let respuesta:Int = costo.costoPorVehiculo + calcularTramo(pHoraEvaluar: horaEvaluar)
                
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
    
    func listarVehiculosRetirados() {
        
        if autosRetirados.count < 1 {
            print(" 0")
        }
        else {
            autosRetirados.forEach { autoRetirado in
                print("\(autoRetirado.tipo) \(autoRetirado.plate) hora ingreso: \(autoRetirado.horaIngreso) hora salida: \(autoRetirado.horaSalida) monto pagado: $\(autoRetirado.montoPagado)")
            }
            print("Se han retirado : \( cantRetiradosMontoAcumulado.0) vehiculos")
        }
    }
    
    func totalGanancias() -> Int {
        
        var ganancia:Int = 0
        
        autosRetirados.forEach { autoRetirado in
            ganancia = ganancia + Int(autoRetirado.montoPagado)
        }
        
        return ganancia
    }
    
    mutating func insertarVehiculo(auto:Vehicle) {
        vehicles.insert(auto)
    }
    
    mutating func insertarRetirado(auto:Vehicle, horaSalir:Int, monto:Int) {
        var autoConMontoPagado:Vehicle = auto
        autoConMontoPagado.montoPagado = monto
        autoConMontoPagado.horaSalida = horaSalir
        autosRetirados.append(autoConMontoPagado)
        
        let cantidadRetirados = autosRetirados.count
        cantRetiradosMontoAcumulado.0 = cantidadRetirados
        cantRetiradosMontoAcumulado.1 = monto
    }
    
    mutating func eliminarVehiculo(pAuto:Vehicle) { //Debido a que salio del estaciomaniento
        vehicles.remove(pAuto)
    }
    
    func contarVehiculosRetirados() -> Int {
        return autosRetirados.count
    }
    
    func cantidadEstacionamientosDisponibles() -> Int {
        
        let cantidadOcupados = vehicles.count
        let cantDisponibles = 20 - cantidadOcupados
        return cantDisponibles
    }
    
    func calcularTramo(pHoraEvaluar:Int) -> Int {
        
        var respuesta:Int=0
        
        let horaEvaluarDividida100:Float = Float(pHoraEvaluar) / 100
        let horaMultiplicadaPor60 = horaEvaluarDividida100 * 60
        
        if horaMultiplicadaPor60 <= 120 {
            return 0
        }
        else {
            let reminderMins = horaMultiplicadaPor60 - 120
            respuesta += Int(ceil(Double(reminderMins) / 15.0)) * 5
        }
            
        return respuesta
    }
}
