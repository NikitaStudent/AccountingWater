//
//  CustomViewController.swift
//  AccountingWater
//
//  Created by Никита on 02.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
    func customViewStart(startdata:Int)
}

class CustomViewController: UIViewController {
    @IBOutlet weak var startTextField: UITextField!
    
    weak var delegateStart: CustomViewDelegate? = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Custom"
    }
    
    @IBAction func customButton(_ sender: Any) {
        if GlobalState.start <= GlobalState.finish {
            let startCustom = NSString(string:startTextField.text!).integerValue
            GlobalState.start = startCustom
            delegateStart?.customViewStart(startdata: startCustom)
            navigationController?.popViewController(animated: true)
        }
        else{
            print("Limit")
        }
    }
    
}
