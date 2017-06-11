//
//  ViewController.swift
//  Calculator
//
//  Created by 陈齐斌 on 15/10/2016.
//  Copyright © 2016 Tsinghua University. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel! {
        didSet {
            display.text = welcome
        }
    }
    
    var welcome: String = "0"
    
    private var brain = CalculatorBrain()
    
    private var userIsInTheMiddleOfTyping: Bool = false
    
    private var displayNumber: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayNumber)
            userIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        displayNumber = brain.result
    }
}
