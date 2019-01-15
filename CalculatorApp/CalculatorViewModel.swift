//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Tushar  Jadhav on 2019-01-14.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import Foundation

enum OperationType {
    case addtion
    case subtraction
    case multiplication
    case division
    case modulo
    case reverse
    case equal
}

struct CalculatorViewModel {
    
    
    // MARK: - Calculation methods

//    func calculateResult(previousNumber: Double, currentNumber: Double, operation: OperationType) -> Double {
//
//        var result : Double = 0
//
//        switch operation {
//        case .addtion:
//            result = previousNumber + currentNumber
//        case .subtraction:
//            result = previousNumber - currentNumber
//        case .division:
//            result = previousNumber / currentNumber
//        case .multiplication:
//            result = previousNumber * currentNumber
//        case .modulo:
//            result = currentNumber / 100
//        case .reverse:
//            result = -currentNumber
//        default:
//            result = currentNumber
//        }
//
//        return result.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", result) : result
//
//    }

    func calculateResult(previousNumber: Double, currentNumber: Double, operation: OperationType) -> String {
        
        var result : Double = 0
        
        switch operation {
        case .addtion:
            result = previousNumber + currentNumber
        case .subtraction:
            result = previousNumber - currentNumber
        case .division:
            result = previousNumber / currentNumber
        case .multiplication:
            result = previousNumber * currentNumber
        case .modulo:
            result = currentNumber / 100
        case .reverse:
            result = -currentNumber
        default:
            result = currentNumber
        }
        
        return result.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", result) : String(result)
    }
    
    func selectOperation(buttonValue : String) -> OperationType  {
        
        switch buttonValue {
        case "+":
            return OperationType.addtion
        case "-":
            return OperationType.subtraction
        case "x":
            return OperationType.multiplication
        case "/":
            return OperationType.division
        case "%":
            return OperationType.modulo
        case "+/-":
            return OperationType.reverse
        default:
            return OperationType.equal
        }
    }
}
