//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 1, "Medium": 2, "Hard": 3]
    var secondsRemaining = 60
    var timer = Timer()

    
    @IBOutlet weak var titleLable: UILabel!
    
    
    @IBAction func haradnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
      let hardness = sender.currentTitle!
        
      let minutes = eggTime[hardness]!
        secondsRemaining = minutes * 60
        
       timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
           if self.secondsRemaining > 0 {
               print ("\(self.secondsRemaining) seconds")
               self.secondsRemaining -= 1
              
               if self.secondsRemaining == 0 {
                   self.titleLable.text = "Cabooo"
               }
               
           } else {
                    Timer.invalidate()
                }
            }
      
    }
    
    
    
    
    

}
