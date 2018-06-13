//
//  TimerViewController.swift
//  boardTimer
//
//  Created by buri on 2018. 6. 13..
//  Copyright © 2018년 tina. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addGameTextField: UITextField!
    @IBOutlet weak var addTimeTextField: UITextField!
    
    var gameItemsDic = [
        ["game":"루미큐브11", "time":"30"],
        ["game":"경찰과 도둑11", "time":"60"],
        ["game":"다빈치 코드", "time":"90"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonTapped(_ sender: YTRoundedButton) {
        insertNewVideoTitle()
    }
    
    func insertNewVideoTitle() {
        
        if addGameTextField.text!.isEmpty {
            print("Add Game Text Field is empty")
            //TODO modal
        }
        
        if addTimeTextField.text!.isEmpty {
            print("Add Time Text Field is empty")
            //TODO modal
        }
        
        let gameTitle = addGameTextField.text!
        let timeLabel = addTimeTextField.text!
        gameItemsDic.append(["game":gameTitle,"time":timeLabel])
        
        let indexPath = IndexPath(row: gameItemsDic.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        addGameTextField.text = ""
        addTimeTextField.text = ""
        
        view.endEditing(true)
    }

}


extension TimerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameItemsDic.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gameDic = gameItemsDic[(indexPath as NSIndexPath).row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell

        cell.titleLabel.text = gameDic["game"]
        cell.timeLabel.text = gameDic["time"]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            gameItemsDic.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
   
}

