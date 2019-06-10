//
//  CalcViewController.swift
//  CalculatorApp
//
//  Created by Jordan Hendrickson on 6/10/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    
    @IBOutlet weak var calculatorTextLabel: UILabel!
    
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
//    var firstNumberText = ""
//    var secondNumberText = ""
//    var op = ""
//    var isFirstNumber = true
//    var hasOp = false
//    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        calculatorTextLabel.text = ""
    }
    

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if canClear {
            calculatorTextLabel.text = ""
            canClear = false
        }
        let currentText = calculatorTextLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "x", "/", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                calculatorTextLabel.text = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                calculatorTextLabel.text = "\(result ?? "")"
            case "+/-":
                isFirstNumber = true
                hasOp = false
                canClear = false
                var value = Double(currentText)!
                value = value * -1
                let result = calculate()
                calculatorTextLabel.text = "\(result ?? "")\(value)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                calculatorTextLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
//    var value: [Value] = []
    func calculate() -> Any? {
       guard let firstNumber = Double(firstNumberText) else {return nil}
       guard let secondNumber = Double(secondNumberText) else {return nil}
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return "\(firstNumber + secondNumber)"
//            return "You suck get smart that shit is easy"
        case "-":
            return "\(firstNumber - secondNumber)"
        case "x":
            return "\(firstNumber * secondNumber)"
        case "/":
            return "\(firstNumber / secondNumber)"
        default:
            return "You suck"
            }
        }
    }



//        if canClear {
//            calculaterTextView.text = ""
//            canClear = false
//        }
//        let currentText = calculaterTextView.text
//        let textLabel = sender.titleLabel?.text
//        if let text  = textLabel {
//            switch text {
//            case "+" , "x" , "/" , "-":
//                if hasOp {
//                    return
//                }
//                op = text
//                isFirstNumber = false
//                hasOp = true
//                calculaterTextView.text = "\(currentText ?? "") \(op)"
//                break
//            case "=" :
//                isFirstNumber = true
//                hasOp = false
//                canClear = true
//                let result = calculate()
//                calculaterTextView.text = "\(result ?? 0.0)"
//                break
//            default:
//                if isFirstNumber {
//                    firstNumberText = "\(firstNumberText)\(text)"
//                } else {
//                    secondNumberText = "\(secondNumberText)\(text)"
//                }
//                calculaterTextView.text = "\(currentText ?? "")\(text)"
//                break;
//            }
//        }
//    }
//
//
//
//
//        func calculate() -> Double? {
//            guard let firstNumber = Double(firstNumberText) else {return nil}
//            guard let secondNumber = Double(secondNumberText) else {return nil}
//            switch op {
//            case "+": return firstNumber + secondNumber
//            case "-": return firstNumber - secondNumber
//            case "*": return firstNumber * secondNumber
//            case "/": return firstNumber / secondNumber
//            default: return 0 }
//    }
//
//
//}
