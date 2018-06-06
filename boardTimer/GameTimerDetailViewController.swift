//
//  GameTimerDetailViewController.swift
//  boardTimer
//
//  Created by buri on 2018. 6. 6..
//  Copyright © 2018년 tina. All rights reserved.
//

import UIKit
var gameItemsDic = ["루미큐브" : 30, "경찰과 도둑" : 60, "다빈치 코드" : 90]

class GameTimerDetailViewController: UIViewController, UITextFieldDelegate {
 
    var gameItem = [:] as Dictionary
    
    
    @IBOutlet weak var gameTextLabel: UITextField!
    @IBOutlet weak var gameTimeTextField: UITextField!
    
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    

}

extension GameTimerDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameItemsDic.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("t")
        
        let gameTitle = Array(gameItemsDic.keys)[indexPath.row]
        print(gameTitle)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameItemCell", for:indexPath)
        cell.textLabel?.text = gameTitle
        return cell
        
    }
    
    
}
