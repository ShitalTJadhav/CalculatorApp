//
//  CalculatorViewController.swift
//  CalculatorApp
//
//  Created by Tushar  Jadhav on 2019-01-14.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var viewModel : CalculatorViewModel!
    var operation : OperationType?
    var currentNumberInLabel = "0"
    var storedValue : Double = 0
    var isOperationSelect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CalculatorViewModel()
        operation = .equal
    }
    
    // MARK: - Button Action methods
    
    @IBAction func numbersButtonClick(_ sender : UIButton) {
        if isOperationSelect {
            currentNumberInLabel = resultLabel.text! + (sender.titleLabel?.text)!
        } else {
            isOperationSelect = true
            currentNumberInLabel = (sender.titleLabel?.text)!
        }
        
        resultLabel.text! = currentNumberInLabel
    }
    
    @IBAction func operationButtonClick(_ sender : UIButton) {
        
        isOperationSelect = false
        
        //Calculate result
        doOperation()
        
        //Store current number as stored value
        storedValue = Double(currentNumberInLabel)!
        operation = viewModel.selectOperation(buttonValue: (sender.titleLabel?.text)!)
        currentNumberInLabel = "0"
    }

    @IBAction func equalButtonClick(_ sender : UIButton) {
        //Do the operation of selected number
        doOperation()
        
        //Clear all prevoius actions and stored number
        resetOperation()
    }
    
    @IBAction func clearTextButtonClick(_ sender : UIButton) {
        resultLabel.text = "0"
        self.resetOperation()
    }
    
    // MARK: - Calculate result methods

    func doOperation()
    {
        let currentValue = Double(currentNumberInLabel)!

        //Calculate total based on selected operation, prevoius number and current number enter
        let total = viewModel.calculateResult(previousNumber: storedValue, currentNumber: currentValue, operation: operation!)
        
        //Show calculate number on view
       // setValueOnLabel(value: total)
        resultLabel.text = total
        //Show blink animation to label
        resultLabel.blink()
        
//        currentNumberInLabel = "0"
        storedValue = 0
        currentNumberInLabel = resultLabel.text!
    }
    
    // MARK: - Reset Value methods

    func resetOperation() {
        storedValue = 0
        currentNumberInLabel = resultLabel.text!
        isOperationSelect = false
        operation = .equal
    }
}
