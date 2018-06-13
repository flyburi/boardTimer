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
    
    
    var games: [String] = ["루미큐브", "경찰과 도둑","다빈치 코드"]
//    var gameItemsDictionary = ["루미큐브" : 30, "경찰과 도둑" : 60, "다빈치 코드" : 90]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonTapped(_ sender: YTRoundedButton) {
        insertNewVideoTitle()
    }
    
    func insertNewVideoTitle() {
        
        if addGameTextField.text!.isEmpty {
            print("Add Game Text Field is empty")
        }
        
        games.append(addGameTextField.text!)
        
        let indexPath = IndexPath(row: games.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        addGameTextField.text = ""
        view.endEditing(true)
    }

}


extension TimerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gameTitle = games[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
        cell.titleLabel.text = gameTitle
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            games.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
   
}

