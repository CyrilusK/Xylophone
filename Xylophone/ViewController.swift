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
    var player: AVAudioPlayer!
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
    func playSound(_ button: String) -> Void {
        guard let path = Bundle.main.path(forResource: button, ofType: "wav") else { return }
        let url = URL(fileURLWithPath: path)
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}

