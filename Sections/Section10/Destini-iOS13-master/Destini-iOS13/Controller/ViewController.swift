//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    @IBAction func choiceMade(_ sender: UIButton) {
        
        
        let userChoice = sender.currentTitle!
        
        storyBrain.getNewStory(userChoice: userChoice)
        
        updateView()
    }

    
    

   
    
  
    

    
    func updateView() {
        storyLabel.text = storyBrain.stories[storyBrain.actualStory].title
        choice1Button.setTitle(storyBrain.stories[storyBrain.actualStory].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[storyBrain.actualStory].choice2, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateView()

    }


}

