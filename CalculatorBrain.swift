//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 陈齐斌 on 20/10/2016.
//  Copyright © 2016 Tsinghua University. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    var result: Double {
        get {
            return value
        }
    }
    
    private var value = 0.0
    
    func setOperand(operand: Double) {
        value = operand
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "-": Operation.BinaryOperation({ $0 - $1 }),
        "×": Operation.BinaryOperation({ $0 * $1 }),
        "÷": Operation.BinaryOperation({ $0 / $1 }),
        "=": Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    private var pending: pendingBinaryOperationInfo?
    
    struct pendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let tmp):
                value = tmp
            case .UnaryOperation(let function):
                value = function(value)
            case .BinaryOperation(let function):
                performEquals()
                pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: value)
            case .Equals:
                performEquals()
            }
        }
    }
    
    func performEquals() {
        if pending != nil {
            value = pending!.binaryFunction(pending!.firstOperand, value)
            pending = nil
        }
    }
    
}
