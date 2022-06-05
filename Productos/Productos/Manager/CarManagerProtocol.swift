//
//  CarManagerProtocol.swift
//  Productos
//
//  Created by Training on 25-05-22.
//

import Foundation

protocol CarManagerProtocol {
    
    var cars:[Car] {get set}
    
    func addCar(auto:Car)
    func removeCar(index:Int)
    func listarCarros()
}
