//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var isFinishedTyping: Bool = true
    
    private var displayValue: Double{
        get{
            if let number = Double(displayLabel.text!) {
                return number
            }else{
                return 0.0
            }
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
   private var calculator = calculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        
        if let calcMethod = sender.currentTitle{
            
            calculator.setNumber1(displayValue)
            
            if let value = calculator.calculate(method: calcMethod) {
                displayValue = value
            }
            
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping{
                
                if displayLabel.text! == "0" && numValue == "."{
                    displayLabel.text = "0.0"
                }else{
                    displayLabel.text = numValue
                }
                isFinishedTyping = false
            }else{
                
                if(numValue == "." ){
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                if(displayLabel.text!=="0.0" && numValue=="."){
                    return
                }
                displayLabel.text = displayLabel.text! + numValue
                
                
            }
            
        }
    }
    
}

