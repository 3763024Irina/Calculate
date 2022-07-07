//
//  ViewController.swift
//  Calculate333
//
//  Created by Irina on 16/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateResult: UILabel!
    var stillTyping = false
    var dotIsPlace = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var currentInput: Double {
        get {
            return Double(calculateResult.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                calculateResult.text = "\(valueArray[0])"
            } else {
                calculateResult.text = "\(newValue)"
            }
            calculateResult.text = "\(newValue)"
            stillTyping = false
        }
    }
   

    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        if stillTyping {
            if (calculateResult.text?.count)! < 20 {
                calculateResult.text = calculateResult.text! + number
            }
        } else {
            calculateResult.text = number
            stillTyping = true
        }
    }
    @IBAction func twoOperandsPlus(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlace = false
    }
    func operateWithTwoOperands(operacion: (Double, Double) -> Double) {
        currentInput = operacion(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        dotIsPlace = false
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
       
        default: break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        calculateResult.text = "0"
        stillTyping = false
        dotIsPlace = false
        operationSign = ""
        
    }
    
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percenageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    @IBAction func squareButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping  && !dotIsPlace {
            calculateResult.text = calculateResult.text! + "."
            dotIsPlace = true
        } else if !stillTyping && !dotIsPlace {
            calculateResult.text = "0."
        }
    }
    
}

    
  


