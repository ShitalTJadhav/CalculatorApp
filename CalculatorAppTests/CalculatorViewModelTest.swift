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

    func getActualResult(prevoiusValue: Double, currentValue: Double, expected: Double, operation: OperationType)  {
        
        //Call viewmodel method to get actual result
        let result = Double(viewModel.calculateResult(previousNumber: prevoiusValue, currentNumber: currentValue, operation: operation))
        
        XCTAssert(result == expected, "\(operation) of 2 number is wrong")
    }
    
    func testPassWith_AdditionOperation()  {
        getActualResult(prevoiusValue: 10, currentValue: 30, expected: 40, operation: .addtion)
    }
    
    func testPassWith_SubtractionOperation()  {
        getActualResult(prevoiusValue: 45, currentValue: 15, expected: 30, operation: .subtraction)
    }
    
    func testPassWith_MultiplicationOperation()  {
        getActualResult(prevoiusValue: 5, currentValue: 3, expected: 15, operation: .multiplication)
    }
    
    func testPassWith_DivisionOperation()  {
        getActualResult(prevoiusValue: 30, currentValue: 5, expected: 6, operation: .division)
    }

    func testPassWith_EqualOperation()  {
        getActualResult(prevoiusValue: 11, currentValue: 35, expected: 35, operation: .equal)
    }
    
    func testPassWithSelectOperation_withButtonTitle()  {
        
        //Test Addition Opertor is selected
        XCTAssert(viewModel.selectOperation(buttonValue: "+") == OperationType.addtion)
        
        //Test Addition Opertor is selected
        XCTAssert(viewModel.selectOperation(buttonValue: "-") == OperationType.subtraction)
        
        //Test Addition Opertor is selected
        XCTAssert(viewModel.selectOperation(buttonValue: "x") == OperationType.multiplication)
        
        //Test Addition Opertor is selected
        XCTAssert(viewModel.selectOperation(buttonValue: "÷") == OperationType.division)
        
    }
    
//    func testUserSelectOperations() {
//
//        let operations = OperationType.allCases
//        // print("operations : ",operations)
//
//        for i in 12...15 {
//            let result = viewModel.setOperation(tag: i)
//            XCTAssertEqual(result, operations[i-12])
//        }
//    }
    
}
