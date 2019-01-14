//
//  CalculatorViewModelTest.swift
//  CalculatorAppTests
//
//  Created by Tushar  Jadhav on 2019-01-14.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorViewModelTest: XCTestCase {

    var viewModel : CalculatorViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewModel = CalculatorViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testAllOperations(number1: Double, number2: Double, expected: Double, operation: OperationType)  {
        
        let result = viewModel.calculateResult(number1: number1, number2: number2, operation: operation)
        
        XCTAssert(result == expected, "\(operation) of 2 number is wrong")
    }
    
    func testAddition()  {
        testAllOperations(number1: 10, number2: 30, expected: 40, operation: .addtion)
    }
    
    func testSubtraction()  {
        testAllOperations(number1: 45, number2: 15, expected: 30, operation: .subtraction)
    }
    
    func testMultiplication()  {
        testAllOperations(number1: 5, number2: 3, expected: 15, operation: .multiplication)
    }
    
    func testDivision()  {
        testAllOperations(number1: 30, number2: 5, expected: 6, operation: .division)
    }

}
