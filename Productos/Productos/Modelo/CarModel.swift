//
//  CarModel.swift
//  Productos
//
//  Created by Training on 25-05-22.
//

import Foundation

class Car {
    var name:String
    var age:Int
    var des:String
    var plate:String
    var cantidadMarchas:Int
    
    init (name:String, age:Int, des:String, plate:String, cantidadMarchas:Int){
        self.name = name
        self.age = age
        self.des = des
        self.plate = plate
        self.cantidadMarchas = cantidadMarchas
    }
}

extension Car {
    var fullDescription:String {
        return "Placa : \(plate), name: \(name) description: \(des), cantidad Marchas \(cantidadMarchas)"
    }
}
