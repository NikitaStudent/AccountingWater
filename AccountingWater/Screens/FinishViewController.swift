//
//  FinishViewController.swift
//  AccountingWater
//
//  Created by Никита on 29.04.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

protocol AddScreenDelegate: class {
    func addScreenFinished(data:Int)
}

class FinishViewController: UIViewController {
    @IBOutlet weak var finishTextField: UITextField!
    
    weak var delegate: AddScreenDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Дневная норма"
        
        //Settings Button "Done" for keyboard
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        // adding button "Done"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonTapped))
        toolBar.items = [doneButton]
        toolBar.isUserInteractionEnabled = true
        finishTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonTapped(){
        view.endEditing(true)
    }
    
    let alert = UIAlertController(title: "", message: "Превышен лимит", preferredStyle: .alert)
    let alert1 = UIAlertController(title: "", message: "Слишком маленький лимит", preferredStyle: .alert)
    let okAction = UIAlertAction(title: " ОК", style: .default)

    @IBAction func saveButton(_ sender: Any) {
    let max = NSString(string:finishTextField.text!).integerValue
        if max <= 5000{
            if max >= 500{
            GlobalState.finish = max
            delegate?.addScreenFinished(data: max)
            navigationController?.popViewController(animated: true)
            }
            else{
                alert1.addAction(okAction)
                present(alert1, animated: true, completion: nil)
            }
        }
        else{
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
