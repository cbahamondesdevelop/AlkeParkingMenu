import Foundation
import Darwin

let funcionesComunes = Comunes()
var respuesta:String? = ""
var opcionAUX:Int = 0

repeat {
    
    print("---Bienvenido AlkeParking----")
    print("                             |")
    print("1) Estacionar Vehiculo       |")
    print("2) Salir de Estacionamiento  |")
    print("3) Total de Ganancias        |")
    print("4) Total Vehiculos retirados |")
    print("5) Vehiculos estacionados    |")
    print("6) Cantidad disponibles      |")
    print("7) Cerrar sistema            |")
    print("                             |")
    print("-----------------------------")
    print("Ingrese opcion: ")
    
    respuesta = readLine()
    var opcion = respuesta ?? ""
    
    if opcion == ""
    {
        print("Debe ingresar opcion")
        opcion = "0"
    }
    opcionAUX = Int(opcion) ?? 0
    
    switch opcionAUX {
        
    case 1: funcionesComunes.opcion1()
        
    case 2: if funcionesComunes.estacionamiento.vehicles.count > 0 {
        funcionesComunes.opcion2()}
        else {
            print("No hay vehiculos estacionados")
        }
        
    case 3: funcionesComunes.opcion3()
        
    case 4: if funcionesComunes.estacionamiento.autosRetirados.count > 0 {
        funcionesComunes.opcion4()}
        else {
            print("No hay vehiculos retirados el dia de hoy")
        }
        
    case 5: funcionesComunes.opcion5()
        
    case 6: funcionesComunes.opcion6()
        
    case 7: print("CERRANDO PROGRAMA")
    default: print("OPCION INVALIDA")
        
    }
    
} while opcionAUX != 7


/*
let n1 = Parking()
let hora = 1900-1200
let res = n1.calcularTramo(pHoraEvaluar: hora)
print(res)
*/
