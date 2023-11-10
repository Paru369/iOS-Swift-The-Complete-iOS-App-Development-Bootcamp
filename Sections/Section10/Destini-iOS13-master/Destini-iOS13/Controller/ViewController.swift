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
    
    
    @IBAction func choiceMade(_ sender: UIButton) {
    }

    let example = Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right.")
    let example2 = Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead")
    let example3 = Story(title: "You find a teasure chest", choice1: "Open it.", choice2: "Check for traps.")
    
    var stories: Array<Any>
    
    init(stories: Array<Any>) {
   
        self.stories = stories
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        storyLabel.text = "You see a fork in the road."
        choice1Button.setTitle("Take a left.", for: .normal)
        choice2Button.setTitle("Take a right.", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

    }


}

