//
//  ViewController.swift
//  Project 01 - StopWatchMeow
//
//  Created by MichaelChen on 2017/1/20.
//  Copyright © 2017年 MichaelChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartTimer(_ sender: Any) {
        if (isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updataTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func PauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = true
        
        timer.invalidate()
        isPlaying = false
        
    }
    
    @IBAction func Reset(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = true
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    func updataTimer() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
        
    }

}

