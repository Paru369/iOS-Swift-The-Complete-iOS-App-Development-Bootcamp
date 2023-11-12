//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    var total = 0.0
    var tip = 0.1
    var split =  2.0
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    @IBAction func tipChanged(_ sender: UIButton) {
        

            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false

        
        if sender.titleLabel?.text == "0%"{
            zeroPctButton.isSelected = true
            tip = 0
        } else if sender.titleLabel?.text == "10%" {
            tenPctButton.isSelected = true
            tip = 0.1
        } else {
            twentyPctButton.isSelected = true
            tip = 0.2
        }
       
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
      split = sender.value
    updateUI()
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        print(split)
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = calculateBill()
            destinationVC.settings = "Split between \(split) people, with \(tip*100)% tip."
        }
        
    }
    
    
    func updateUI() {
        splitNumberLabel.text = String(format: "%.0f", split)
    }

    func calculateBill() -> String {
        let value = Double(billTextField.text!) ?? 0.0
        
        if value > 0{
            let total = ( value*(1.0 + tip) ) / split
            return String(format: "%.2f", total)
        } else {
            return "Insira um valor"
        }
    }

}

