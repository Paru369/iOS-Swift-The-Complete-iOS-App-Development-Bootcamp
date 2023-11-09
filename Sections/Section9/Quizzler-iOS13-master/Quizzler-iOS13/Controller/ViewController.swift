//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var q1Button: UIButton!
    
    @IBOutlet weak var q2Button: UIButton!
    
    @IBOutlet weak var q3Button: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()


    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        //print(userAnswer)
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        quizBrain.nextQuestion()
        
        if userGotItRight {
            sender.backgroundColor = UIColor.cyan
        } else {
            sender.backgroundColor = UIColor.magenta
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        let getProgress  = quizBrain.progress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        q1Button.setTitle(quizBrain.getOptionText()[0], for: .normal)
        q2Button.setTitle(quizBrain.getOptionText()[1], for: .normal)
        q3Button.setTitle(quizBrain.getOptionText()[2], for: .normal)
        q1Button.backgroundColor = UIColor.clear
        q2Button.backgroundColor = UIColor.clear
        q3Button.backgroundColor = UIColor.clear
        progressBar.progress = getProgress
    }
    
    
    
}
