//
//  main.swift
//  comando1
//
//  Created by Training on 24-05-22.
//

import Foundation

class Persona {
    
    var nombre:String
    var edad:Int
    
    init (nombre:String, edad:Int){
        self.nombre = nombre
        self.edad = edad
    }
    
    func setNombre (nomb:String) {
        nombre = nomb
    }
    func setEdad (eda:Int){
        edad = eda
    }
    func getNombre () -> String {
        return nombre
    }
    func getEdad () -> Int {
        return edad
    }
}

var respuesta:String? = ""
var opcionAUX:Int = 0
let persona1 = Persona(nombre: "", edad: 0)

repeat {
    
    print("-------MENU--------")
    print("1) Ingresar Nombre ")
    print("2) Ingresar Edad   ")
    print("3) Mostrar Nombre  ")
    print("4) Mostrar Edad    ")
    print("5) Mostrar Ambos   ")
    print("6) Salir           ")
    print("-------------------")
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
        
    case 1: print("Ingrese Nombre : ")
        let nombreRespuesta:String? = readLine()
        persona1.setNombre(nomb: nombreRespuesta ?? "")
        
    case 2: print("Ingrese Edad : ")
        let edadRespuesta:String? = readLine()
        if let edadRespuesta = edadRespuesta  {
            persona1.setEdad(eda: Int(edadRespuesta) ?? 0)
        }
        
    case 3: print("El nombre es : " + persona1.getNombre())
    case 4: print("La edad es : " + String(persona1.getEdad()))
    case 5: let edadAux = String(persona1.getEdad())
        print("El nombre es: \(persona1.getNombre()) y tiene \(edadAux) años")
    case 6: print("Cerrando programa")
    default: print("OPCION INVALIDA")
        
    }
    
} while opcionAUX != 6



