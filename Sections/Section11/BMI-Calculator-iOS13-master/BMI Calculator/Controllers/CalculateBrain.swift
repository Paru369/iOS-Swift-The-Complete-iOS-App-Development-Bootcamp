//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Paulo Pinheiro on 11/12/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct CalculateBrain {
 
    var BMI: Float?
    var advice: String = ""
    var background = ""
    
    
    mutating func calculateBMI(height: Float, weight:Float) {
        BMI = weight / pow(height, 2)
       
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", BMI!)
    }
}
