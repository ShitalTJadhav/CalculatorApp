//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Tushar  Jadhav on 2019-01-14.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import Foundation

enum OperationType : CaseIterable {
    case addtion
    case subtraction
    case multiplication
    case division
    case modulo
    case equal
}

struct CalculatorViewModel {
    
    
    // MARK: - Calculation methods

    func calculateResult(number1: Double, number2: Double, operation: OperationType) -> Double {
        
        var result : Double = 0
        
        switch operation {
        case .addtion:
            result = number1 + number2
        case .subtraction:
            result = number1 - number2
        case .division:
            result = number1 / number2
        case .multiplication:
            result = number1 * number2
        case .modulo: break  //Not yet implement
        default:
            result = number2
        }
        
        return result
    }
}
