//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Paulo Pinheiro on 11/12/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    
    var bmi: BMI?
   
    
    
    mutating func calculateBMI(height: Float, weight:Float) {
        let bmiValue = weight / pow(height, 2)
        var advice: String
        var color: UIColor
        if bmiValue < 18.5 {
            advice = "Underweight - Eat more snacks"
            color = UIColor.systemMint
        } else if bmiValue > 24.9 {
            advice = "Overweight - Eat less snacks"
            color = UIColor.orange
        } else {
            advice = "Normal - Just do it"
            color = UIColor.systemTeal
        }
        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
    
    func getBMI() -> String {
        
        return String(format: "%.1f", bmi?.value ?? 0.0)
        
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.gray
    }
}
