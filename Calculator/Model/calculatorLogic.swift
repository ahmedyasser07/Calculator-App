//
//  File.swift
//  Calculator
//
//  Created by Ahmed Abdelfatah on 28/01/2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct calculatorLogic{
    
    private var number1: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber1(_ number: Double){
        self.number1=number
    }
    
    
    mutating func calculate (method : String)->Double?{
        
        if let n = number1{
            
            switch method{
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n/100
            case "=":
                return perform2NumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n , calcMethod: method)
            }
            
        }
        return nil
    }
    
    private func perform2NumberCalculation(n2: Double)->Double?{
        
        if let n1 = intermediateCalculation?.n1 , let operation = intermediateCalculation?.calcMethod{
            
            switch operation{
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "×":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("the operation does not match any of the cases")
            }
        }
        return nil
        
    }
}
