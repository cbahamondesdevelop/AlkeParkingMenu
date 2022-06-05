//
//  MathOperation.swift
//  uniTest
//
//  Created by Training on 30-05-22.
//

import Foundation

class MathOperation {
    func sumar (num1:Int, num2:Int) -> Int {
        return num1  + num2
    }
    
    func restar(num1:Int, num2:Int) -> Int {
        return num1 - num2
    }
    
    func multiplicar(num1:Int, num2:Int) -> Int {
        return num1 * num2
    }
    
    func consolidado(num1: Int, num2: Int, operationType: OperationType) -> Int {
            switch operationType {
            case .sumar:
                return sumar(num1: num1, num2: num2)
            case .restar:
                return restar(num1: num1, num2: num2)
            case .multiplicar:
                return multiplicar(num1: num1, num2: num2)
            }
        }
}

extension MathOperation {
    enum OperationType {
        case sumar
        case restar
        case multiplicar
    }
}
