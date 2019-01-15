//
//  CalculatorViewUITesting.swift
//  CalculatorAppUITests
//
//  Created by Tushar  Jadhav on 2019-01-14.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import XCTest

class CalculatorViewUITesting: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testAllButtonExits() {
//
//        //Check all button exits
//        XCTAssertTrue(app.buttons["addition"].exists)
//        XCTAssertTrue(app.buttons["subtraction"].exists)
//        XCTAssertTrue(app.buttons["multiplication"].exists)
//        XCTAssertTrue(app.buttons["division"].exists)
//        XCTAssertTrue(app.buttons["equal"].exists)
//        XCTAssertTrue(app.buttons["modulo"].exists)
//        XCTAssertTrue(app.buttons["reverse"].exists)
//        XCTAssertTrue(app.buttons["0"].exists)
//        XCTAssertTrue(app.buttons["1"].exists)
//        XCTAssertTrue(app.buttons["2"].exists)
//        XCTAssertTrue(app.buttons["3"].exists)
//        XCTAssertTrue(app.buttons["4"].exists)
//        XCTAssertTrue(app.buttons["5"].exists)
//        XCTAssertTrue(app.buttons["6"].exists)
//        XCTAssertTrue(app.buttons["6"].exists)
//        XCTAssertTrue(app.buttons["7"].exists)
//        XCTAssertTrue(app.buttons["8"].exists)
//        XCTAssertTrue(app.buttons["9"].exists)
//        XCTAssertTrue(app.buttons["."].exists)
//    }
    
    func checkAllNumberButtonsValue(button : XCUIElement, expectedValue: String ) {
        //Check all button exits
        button.tap()
        
        //Check tap number is shown on label
        //XCTAssertEqual(app.staticTexts["Calculation-ResultLabel"].label, expectedValue)
        XCTAssertTrue(app.staticTexts["Calculation-ResultLabel"].label == expectedValue, "Tap number is showing wrong on label")

        app.buttons["ClearButton"].tap()
    }
    
    func testAllButtonsValueAndResultLabel() {
        
        checkAllNumberButtonsValue(button: app.buttons["0"], expectedValue: "0")
        checkAllNumberButtonsValue(button: app.buttons["."], expectedValue: ".")
        checkAllNumberButtonsValue(button: app.buttons["1"], expectedValue: "1")
        checkAllNumberButtonsValue(button: app.buttons["2"], expectedValue: "2")
        checkAllNumberButtonsValue(button: app.buttons["3"], expectedValue: "3")
        checkAllNumberButtonsValue(button: app.buttons["4"], expectedValue: "4")
        checkAllNumberButtonsValue(button: app.buttons["5"], expectedValue: "5")
        checkAllNumberButtonsValue(button: app.buttons["6"], expectedValue: "6")
        checkAllNumberButtonsValue(button: app.buttons["8"], expectedValue: "8")
        checkAllNumberButtonsValue(button: app.buttons["9"], expectedValue: "9")
    }

    
    func testAdditionOperation() {
        
        app.buttons["1"].tap()
        app.buttons["5"].tap()
        
        //Check tap number is shown on label
        XCTAssertTrue(app.staticTexts["Calculation-ResultLabel"].label == "15", "Tap number is showing wrong on label")
 
        app.buttons["addition"].tap()
        app.buttons["4"].tap()
        app.buttons["addition"].tap()
        app.buttons["6"].tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["equal"]/*[[".buttons[\"=\"]",".buttons[\"equal\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(app.staticTexts["Calculation-ResultLabel"].label, "25")

        app.buttons["ClearButton"].tap()
    }

    func testSubtractionOperation() {
        
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["subtraction"]/*[[".buttons[\"-\"]",".buttons[\"subtraction\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["2"].tap()
        app.buttons["6"].tap()
        app.buttons["equal"].tap()
        XCTAssertEqual(app.staticTexts["Calculation-ResultLabel"].label, "39")
        
        app/*@START_MENU_TOKEN@*/.buttons["ClearButton"]/*[[".buttons[\"C\"]",".buttons[\"ClearButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testMultiplicationOperation() {
        
        app.buttons["4"].tap()
        app.buttons["multiplication"].tap()
        app.buttons["6"].tap()
        app.buttons["equal"].tap()
        XCTAssertEqual(app.staticTexts["Calculation-ResultLabel"].label, "24")
        
        app/*@START_MENU_TOKEN@*/.buttons["ClearButton"]/*[[".buttons[\"C\"]",".buttons[\"ClearButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testDivisionOperation() {
        
        app.buttons["3"].tap()
        app.buttons["0"].tap()
        app.buttons["division"].tap()
        app.buttons["6"].tap()
        app.buttons["equal"].tap()
        XCTAssertTrue(app.staticTexts["Calculation-ResultLabel"].label == "5")
        
        app/*@START_MENU_TOKEN@*/.buttons["ClearButton"]/*[[".buttons[\"C\"]",".buttons[\"ClearButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testReverseOperation() {
        
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["reverse"].tap()
        XCTAssertTrue(app.staticTexts["Calculation-ResultLabel"].label == "-65")
        
        app/*@START_MENU_TOKEN@*/.buttons["ClearButton"]/*[[".buttons[\"C\"]",".buttons[\"ClearButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
}
