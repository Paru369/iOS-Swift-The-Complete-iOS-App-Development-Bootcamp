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
    var timeElapsed = 0
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func haradnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        timeElapsed = 0
        titleLable.text = ""
      let hardness = sender.currentTitle!
      let minutes = eggTime[hardness]!
        secondsRemaining = minutes * 60
        
        
        
        
        timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
           if self.secondsRemaining > 0 {
               print ("\(self.secondsRemaining) seconds")
               self.secondsRemaining -= 1
               self.timeElapsed += 1
               self.progressBar.progress = Float(self.timeElapsed) / Float(60 * minutes)
               self.timerLabel.text = "\(self.secondsRemaining)"
               self.titleLable.text = hardness
               
               
               if self.secondsRemaining == 0 {
                   self.titleLable.text = "DONE"
               }
               
           } else {
                    Timer.invalidate()
                }
            }
        
    }
    
    
   
    
    
    

}
