//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        let BMI = weight / pow(height, 2)
        print(BMI)
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.2f", BMI)
        self.present(secondVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

