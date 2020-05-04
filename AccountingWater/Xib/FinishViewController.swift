//
//  FinishViewController.swift
//  AccountingWater
//
//  Created by Никита on 29.04.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

protocol AddScreenDelegate: class {
    func addScreenFinished(data:String)
}

class FinishViewController: ViewController {

    @IBOutlet weak var FinishTextField: UITextField!
    
   weak var delegate: AddScreenDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Daily norm"
    }

    @IBAction func SaveButton(_ sender: Any) {
        if delegate != nil{
            if FinishTextField.text != nil{
                let data = FinishTextField.text
                delegate?.addScreenFinished(data: data!)
            dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
