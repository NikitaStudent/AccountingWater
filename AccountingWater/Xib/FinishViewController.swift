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
        // MAKE: Settings ToolBar for Keyboard
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
            toolBar.barStyle = .default
            toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonTapped))
        toolBar.items = [doneButton]
        toolBar.isUserInteractionEnabled = true
        FinishTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonTapped(){
        view.endEditing(true)
    }

    @IBAction func SaveButton(_ sender: Any) {
//        if delegate != nil{
//            if FinishTextField.text != nil{
//                let data = FinishTextField.text
//                delegate?.addScreenFinished(data: data!)
//                navigationController?.popViewController(animated: true)
//            }
//        }
    }
}
