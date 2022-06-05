import UIKit
import Darwin

// TAREA DE CALLBACKS
// 1. vamos a definir una funcion que tenga un callback con los siguiente parametros (Float, Int) -> ()
// 2. vamos a definir una funcion que tenga un callback con los siguiente parametros (Int) -> (String)
// 3. vamos a definir una funcion que tenga un callback con los siguiente parametros (Float, Float) -> (Float)
// 4. vamos a definir una funcion que tenga un callback con los siguiente parametros (String, String, String) -> (Int) YA ESTá RESUELTO

// 5. RETO: vamos a definir una funcion que tenga un callback con los siguiente parametros ([Persona]) -> ()

// 1 resuelto-------------------------------------------------------------------
func funcion1(callback: (Float, Int)->()) {
    callback(2500.02, 349)

    }

funcion1 { precio, IDProduct in
    print("1 resuelto--------------------------------------------------")
    print("El producto con ID: \(IDProduct) tiene el precio $\(precio) ")
    return
}

// 2 resuelto--------------------------------------------------------------------
func funcion2(callback: (Int)->(String)) {
    print("2 resuelto--------------------------------------------------")
    let respuesta:String = callback(20)
    print(respuesta)
}

func edadMininaIngreso(edad:Int)->String {
    var respuesta:String = ""
    if edad < 20
    {
        respuesta = "Edad invalida"
        return respuesta
    }
    else
    {
        respuesta = "Edad Valida"
        return respuesta
    }
}
funcion2(callback: edadMininaIngreso(edad:))

// 3 resuelto--------------------------------------------------------------------
func funcion3(callback: (Float, Float)->(Float)) {
    //callback(500.02, 322.02)

    let respuesta:Float = callback(1, 835.40)
    print("Valor Dolar : USD $\(respuesta)")
    }

funcion3 { USD, CLP in
    print("3 resuelto--------------------------------------------------")
    let respuesta = CLP * USD
    print("USD $\(USD) Dolares equivale a CLP $\(CLP) ")
    return respuesta
}
// 4 resuelto--------------------------------------------------------------------
func funcion4(edad: Int, callback: (String, String, String) -> (Int) ) {
    print("4 resuelto--------------------------------------------------")
    print("tu edad es: \(edad)")

    let valorEntero: Int = callback("Hola","Mi Nombre es", "Alkemy")
    print(valorEntero)
}

//1. forma de uso
funcion4(edad: 5) { texto1, texto2, texto3 in

    print(texto1)
    print(texto2)
    print(texto3)

    let textoCompleto = texto1 + texto2 + texto3
    return textoCompleto.count
}

// 2. forma de uso
func cantidadDeCaracteres(texto1: String, texto2: String, texto3: String) -> Int {

    let textoCompleto = texto1 + texto2 + texto3
    return textoCompleto.count
}

funcion4(edad: 8, callback: cantidadDeCaracteres(texto1:texto2:texto3:))

// 5 resuelto--------------------------------------------------------------------
class Persona{
    let nombre:String
    let apellido:String
    let edad:Int
    
    init (nombre:String, apellido:String, edad:Int){
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
    }
    
}

func funcion5(callback: ([Persona]) -> () ) {
    /*let persona1 = Persona(nombre: "Pepito", apellido: "Jackson", edad: 15)
    let persona2 = Persona(nombre: "Juanito", apellido: "Jhonson", edad: 12)
    let persona3 = Persona(nombre: "Luchito", apellido: "Roman", edad: 16)
    
    var arregloPersonas:[Persona] = []
    arregloPersonas.append(persona1)
    arregloPersonas.append(persona2)
    arregloPersonas.append(persona3)
    */
    let arregloPersonas:[Persona] = []
    callback(arregloPersonas)
}

func algunasPersonas(pNombre:String, pApellido:String, pEdad:Int) -> ([Persona]) {
    
    let persona1 = Persona(nombre: pNombre, apellido: pApellido, edad: pEdad)
    var arregloPersonas:[Persona] = []
    arregloPersonas.append(persona1)
    
    return arregloPersonas
}

//funcion5(callback: ([algunasPersonas(pNombre: "", pApellido: "", pEdad: 12)]) -> ())
