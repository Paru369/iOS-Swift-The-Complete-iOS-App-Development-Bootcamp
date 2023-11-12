//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBAction func heightActionSlider(_ sender: UISlider) {
        let heightFormatted = String(format: "%.2f", sender.value)
        
        heightLabel.text = heightFormatted + "m"
    }
    
    @IBAction func weightActionSlider(_ sender: UISlider) {
        
        let weightFormatted = String(format: "%.1f", sender.value)
        weightLabel.text = weightFormatted + "kg"
    }
    
  
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
       
        
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculateBrain.getBMI()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
    }


}

