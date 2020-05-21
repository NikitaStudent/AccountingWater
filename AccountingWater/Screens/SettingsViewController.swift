//
//  SettingsViewController.swift
//  AccountingWater
//
//  Created by Никита on 20.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate: class {
    func SettingsDelegateFinish(data:Int)
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var activityText: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    weak var settingsDelegate: SettingsViewDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let weight = NSString(string:weightText.text!).integerValue
        let action = NSString(string:activityText.text!).integerValue
        if segmentedControl.selectedSegmentIndex == 0{
            let man = (Double(weight) * 0.04 + Double(action) * 0.6) * 1000
            GlobalState.finish = Int(man)
            settingsDelegate?.SettingsDelegateFinish(data: Int(man))
        }
        if segmentedControl.selectedSegmentIndex == 1{
            let woman = (Double(weight) * 0.03 + Double(action) * 0.4) * 1000
            GlobalState.finish = Int(woman)
            settingsDelegate?.SettingsDelegateFinish(data: Int(woman))
        }
        navigationController?.popViewController(animated: true)
    }
    
}
