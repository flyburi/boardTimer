//
//  ViewController.swift
//  boardTimer
//
//  Created by buri on 2018. 6. 1..
//  Copyright © 2018년 buri. All rights reserved.
//

import UIKit
import AVFoundation

protocol TimerDelegate {
    func providerSent(_ data: Int)
}

class ViewController: UIViewController, TimerDelegate {

    var timer = Timer()
    var startTime = 30
    var currentTime = 0
    var notiStartTime = 5
    var audioPlayer: AVAudioPlayer?

    var settingTimeSeconds = 0
    
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    @IBAction func pressStart(_ sender: Any) {
        startBtn.isHidden=true
        pauseBtn.isHidden=false
        stopBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        
        if(currentTime == 0) {
            currentTime = startTime
            secondsLabel.text = "\(startTime)"
        }
    }
    @IBAction func pressPause(_ sender: Any) {
        startBtn.isHidden=false
        pauseBtn.isHidden=true
        stopBtn.isEnabled = true
        
        timer.invalidate()
    }
    
    @IBAction func pressStop(_ sender: Any) {
        reset()
        timer.invalidate()
    }
    
    
    @objc func updateTime() {
        currentTime -= 1
        secondsLabel.text = "\(currentTime)"
        
        if(currentTime == notiStartTime){
            playAudio()
        }
        
        if(currentTime == -1) {
            sleep(2)
            reset()
            timer.invalidate()
        }
    }
    func reset() {
        startBtn.isHidden = false
        pauseBtn.isHidden = true
        stopBtn.isEnabled = false
        
        currentTime = startTime
        secondsLabel.text = "\(startTime)"
    }
    
    func playAudio() {
        let url = Bundle.main.url(forResource: "hum", withExtension: "wav")
        
        if let url = url{
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                guard let sound = audioPlayer else { return }
                sound.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime = startTime
        secondsLabel.text = "\(currentTime)"
        
        pauseBtn.isHidden=true
        stopBtn.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func providerSent(_ data: Int) {
        settingTimeSeconds = data
        startTime = settingTimeSeconds
        reset()
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "gotoTimerSegue",
            let dest = segue.destination as? TimerSettingsViewController
        {
            dest.myData = settingTimeSeconds
            dest.delegate = self
        }
    }

}

