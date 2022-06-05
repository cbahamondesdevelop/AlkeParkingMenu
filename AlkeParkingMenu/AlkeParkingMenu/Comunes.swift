import Foundation
import Darwin

class Comunes {
    
    var estacionamiento = Parking()
    
    var placa:String = ""
    var tipoAuto:String = ""
    var horaEntrada:Int = 0
    var horaSalida:Int = 0
    var descuento:Bool = false
    
    func opcion1() {
        
        print("Ingrese placa patente: ")
            let placaRespuesta:String? = readLine()
            if let placaRespuesta = placaRespuesta {
                placa = placaRespuesta
            }
            else {
                print("Debe ingresar placa")
            }
            
            print("--Indique tipo vehiculo-- ")
            print("1) AUTO                  |")
            print("2) MOTO                  |")
            print("3) MINI BUS              |")
            print("4) BUS                   |")
            print("------------------------- ")
            print("Ingrese opcion: ")
            let vehiculoRespuesta:String? = readLine()
            
            switch vehiculoRespuesta {
            case "1": tipoAuto = tipoVehiculo.auto.rawValue
            case "2": tipoAuto = tipoVehiculo.moto.rawValue
            case "3": tipoAuto = tipoVehiculo.minibus.rawValue
            case "4": tipoAuto = tipoVehiculo.bus.rawValue
            default: print("Debe seleccionar del 1 al 4")
                tipoAuto = tipoVehiculo.otro.rawValue
            }
            
        print("Ingrese hora entrada: ")
            let horaEntradaRespuesta:String? = readLine()
            if let horaEntradaRespuesta = horaEntradaRespuesta {
                horaEntrada = Int(horaEntradaRespuesta) ?? 0
            }
            else {
                print("Debe ingresar hora entrada")
            }
        
        if horaEntrada <= 2300 && horaEntrada >= 800 {
            let vehiculoEstacionado = Vehicle(plate: placa, tipo: tipoAuto, horaIngreso: horaEntrada, horaSalida: 0000, montoPagado: 0)

            if estacionamiento.vehicles.count < 20
            {
                estacionamiento.insertarVehiculo(auto: vehiculoEstacionado)
                
                func validacionEstacionado(callback: (Vehicle)->(String))
                {
                    print("Validando...")
                    let respuesta:String = callback(vehiculoEstacionado)
                    if respuesta.count > 0 {
                        print("Vehiculo estacionado correctamente")
                    }
                }
                validacionEstacionado(callback: vehiculoEstacionadoOK(auto:))
            }
            else
            {
                let ocupadosAUX = estacionamiento.vehicles.count
                func estacionamientoFull(callback: (Int)->(String))
                {
                    let respuesta = callback(ocupadosAUX)
                    print(respuesta)
                }
                estacionamientoFull(callback: estacionamientoLleno(cantOcupado:))
            }
        }
        
        else {
            print("Estacionamiento abre a las 8:00 hrs y cierra a las 2300 Hrs. No puede ingresar")
        }
        
    }
    
    func opcion2() {
        
        print("Ingrese placa patente del vehiculo a retirar: ")
        let placaRespuesta:String? = readLine()
        if let placaRespuesta = placaRespuesta {
            placa = placaRespuesta
        }
        else {
            print("Debe ingresar placa")
        }
        
        print("Ingrese hora de salida: ")
        let horaSalidaRespuesta:String? = readLine()
        if let horaSalidaRespuesta = horaSalidaRespuesta {
            horaSalida = Int(horaSalidaRespuesta) ?? 0
        }
        else {
            print("Debe ingresar hora de salida")
        }
        
        print("Tiene tarjeta descuento (Responda S/N): ")
        let tarjetaRespuesta:String? = readLine()
        if let tarjetaRespuesta = tarjetaRespuesta {
            
            if tarjetaRespuesta == "S" {
                descuento = true
            }
            else {
                descuento = false
            }
    
        }
        else {
            print("Debe ingresar placa")
        }
        
        estacionamiento.vehicles.forEach { auto in
            if auto.plate == placa{
                
                let precioEstacionamiento  = estacionamiento.calcularCostoEstacionamiento(horaIN: auto.horaIngreso, horaOUT: horaSalida, vehiculo: auto, discountCard: descuento)
                
                if precioEstacionamiento > 0 {
                    print("Se retira vehiculo: \(auto.plate) de tipo \(auto.tipo) hora entrada \(auto.horaIngreso) hora salida \(horaSalida)")
                    print("Valor estacionamiento: $" + String(precioEstacionamiento))
                    
                    estacionamiento.insertarRetirado(auto:auto, horaSalir:horaSalida, monto:precioEstacionamiento)
                    
                    estacionamiento.eliminarVehiculo(pAuto: auto)
                }
            }
        }
    }
    
    func opcion3() {
        print("***********************")
        print("Vehiculos retirados hoy")
        estacionamiento.listarVehiculosRetirados()
        
        print("Total ganancias hoy: $\(estacionamiento.totalGanancias())")
        print("***********************")
    }
    
    func opcion4() {
        print("Hoy se ha retirado un total de : \(estacionamiento.contarVehiculosRetirados()) vehiculos")
    }
    
    func opcion5() {
        print("***********************")
        print("Vehiculos Estacionados ")

        estacionamiento.listarVehiculosEstacionados()
        print("***********************")
    }
    
    func opcion6() {
        print("************************")
        print("Cantidad Est Disponibles")

        print("Hay \(estacionamiento.cantidadEstacionamientosDisponibles()) estacionamientos dispobibles")
        print("***********************")
    }
    
    func vehiculoEstacionadoOK(auto:Vehicle)->String {

        let respuesta = estacionamiento.vehicles.filter({ car in
            car.plate == auto.plate
        })
        let respuestaAUX:String = respuesta.description
        
        return respuestaAUX
    }
    
    func estacionamientoLleno(cantOcupado:Int)->String {
        return "Imposible estacionar. Cantidad estacionamientos ocupados: \(cantOcupado)"
    }

}
