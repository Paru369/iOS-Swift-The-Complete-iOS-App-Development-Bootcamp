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
        guard let path = Bundle.main.path(forResource: note, ofType:"wav") else {
            return
            
        }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
    @IBAction func keyCPressed(_ sender: UIButton) {
        playSound(note: "C")
    }
    
    @IBAction func keyDPressed(_ sender: UIButton) {
        playSound(note: "D")
    }
    
    @IBAction func keyEPressed(_ sender: UIButton) {
        playSound(note: "E")
    }
    
    @IBAction func keyFPressed(_ sender: UIButton) {
        playSound(note: "F")
    }
    
    @IBAction func keyGPressed(_ sender: UIButton) {
        playSound(note: "G")
    }
    
    @IBAction func keyAPressed(_ sender: UIButton) {
        playSound(note: "A")
    }
    
    @IBAction func keyBPressed(_ sender: UIButton) {
        playSound(note: "B")
    }
    
}

