//
//  TimerSettingsViewController.swift
//  boardTimer
//
//  Created by burtinai on 2018. 6. 6..
//  Copyright © 2018년 tina. All rights reserved.
//

import UIKit

class TimerSettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var seconds = Array<Int>(1...90)
    var myData: Int?
    var delegate: TimerDelegate?
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        pickerView.delegate = self
        pickerView.dataSource = self
        super.viewDidLoad()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seconds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(seconds[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myData = seconds[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.providerSent(myData!)
    }
    
}
