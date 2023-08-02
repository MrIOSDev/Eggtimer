//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLable: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    let secondsRemaining = 1
    var eggCountDown = 0
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]


    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        
        eggCountDown = secondsRemaining * result
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                        if self.eggCountDown > 0 {
                            print ("\(self.eggCountDown) seconds.")
                            self.eggCountDown -= 1
                        } else {
                            Timer.invalidate()
                            self.titleLable.text = "Done"
                        }
            
            if self.eggCountDown > 0 {
                self.progressBar.setProgress(Float(self.eggCountDown), animated: true)
            } else {
                self.progressBar.progress = 0
            }
                    }
        
        
    }
    
    
}
