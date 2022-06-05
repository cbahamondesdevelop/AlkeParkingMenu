//
//  CarManager.swift
//  Productos
//
//  Created by Training on 25-05-22.
//

import Foundation


class carManager:CarManagerProtocol {
    
    //MARK: Singleton
    static let shared = carManager()
    
    //MARK: Propiedades
    var cars: [Car]
    
    //MARK: Constructor
    init(cars:[Car]=[]){
        self.cars = cars
    }
    
     //MARK: Metodos
    func addCar(auto:Car) {
        cars.append(auto)
    }
    
    func removeCar(index:Int) {
        cars.remove(at: index)
    }
    
    func listarCarros() {
        
        cars.forEach { auto in
            print("Vehiculo : \(auto.name) Año \(auto.age), Descripcion : \(auto.des), Placa \(auto.plate). Cantidad Marchas : \(auto.cantidadMarchas)")
        }
    }
    
}
