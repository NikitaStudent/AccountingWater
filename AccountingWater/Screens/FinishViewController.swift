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

    @IBAction func saveButton(_ sender: Any) {
    let maximal = NSString(string:finishTextField.text!).integerValue
        if maximal <= 5000{
            if maximal >= 500{
                GlobalState.finish = maximal
            delegate?.addScreenFinished(data: maximal)
            navigationController?.popViewController(animated: true)
            }
            else{
                // create the alert
                let alert = UIAlertController(title: "Лимит", message: "Маленькое значение", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        else{
            // create the alert
            let alert = UIAlertController(title: "Лимит", message: "Слишком большое значение", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
