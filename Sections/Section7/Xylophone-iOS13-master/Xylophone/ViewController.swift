//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    func playSound(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
               player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(note: sender.currentTitle ?? "")
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2 ) {

            sender.alpha = 1

        }
    }
    
   
    
}

