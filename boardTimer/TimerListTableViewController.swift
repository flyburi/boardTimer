//
//  TimerListTableViewController.swift
//  boardTimer
//
//  Created by buri on 2018. 6. 4..
//  Copyright © 2018년 tina. All rights reserved.
//

import UIKit
var gameItems = ["루미큐브", "경찰과 도둑","다빈치 코드"]
//var gameItemsDictionary = ["루미큐브" : 30, "경찰과 도둑" : 60, "다빈치 코드" : 90]

class TimerListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameItems.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

        cell.textLabel?.text = gameItems[(indexPath as NSIndexPath).row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            gameItems.remove(at: indexPath.row)
            
            
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
            //gameItems.append(<#T##newElement: String##String#>)
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let itemToMove = gameItems[(fromIndexPath as NSIndexPath).row]
        gameItems.remove(at: (fromIndexPath as NSIndexPath).row)
        gameItems.insert(itemToMove, at: (to as NSIndexPath).row)
       
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "gameTimerDetailSegue",
//            let dest = segue.destination as? GameTimerDetailViewController
//        {
//            dest.gameItem = gameItemsDictionary
//        }
//    }

}
