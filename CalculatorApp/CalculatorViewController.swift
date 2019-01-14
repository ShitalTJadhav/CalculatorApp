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
    var number1 : Double = 0
    var number2 : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CalculatorViewModel()
        resultLabel.text = "0"
        operation = .equal
    }
    
    // MARK: - Button Action methods
    
    @IBAction func numbersButtonClick(_ sender : UIButton) {
        
        if resultLabel.text == "0" || Double(resultLabel.text!) == number1  {
            resultLabel.text = ""
        }
        
        resultLabel.text = resultLabel.text! + (sender.titleLabel?.text)!
    }
    
    @IBAction func operationButtonClick(_ sender : UIButton) {
        
        //Store number 1 in string
        number1 = Double(resultLabel.text!)!
        operation = viewModel.setOperation(tag: sender.tag)
        
        print("Operation : ",operation!)
    }
    
    @IBAction func reverseValueButtonClick(_ sender : UIButton) {
        //Not implemented
    }
    
    @IBAction func moduloButtonClick(_ sender : UIButton) {
        //Not implemented
    }
    
    @IBAction func equalButtonClick(_ sender : UIButton) {
        
        //Get number2 as current number
        number2 = Double(resultLabel.text!)!
        
        //Calculate total based on selected operation, prevoius number and current number enter
        let total = viewModel.calculateResult(number1: number1, number2: number2, operation: operation!)
        print("Result : ",total)
        
        //Show calculate number on view
        resultLabel.text = String(total)
        
        //Clear all prevoius actions and stored number variable
        self.resetOperation()
        
        //Store result as prevoius number in number1 variable
        number1 = total
    }
    
    @IBAction func clearTextButtonClick(_ sender : UIButton) {
        resultLabel.text = "0"
        self.resetOperation()
    }
    
    // MARK: - Reset Value methods

    func resetOperation() {
        number1 = 0
        number2 = 0
        operation = .equal
    }
}
