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
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    
    let quiz = [
    ["O Brasil tem palmeiras?", "True"],
    ["Isso é um Quiz?", "True"],
    ["Existe array 2x2?", "True"],
    ["Isso é uma pergunta?", "False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        print(userAnswer)
        let actualAnser = quiz[questionNumber][1]
        
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
        }
        
        updateUI()
        
        if userAnswer == actualAnser {
            print("OK")
        } else {
            print("Cagou")
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]

    }
    
}

