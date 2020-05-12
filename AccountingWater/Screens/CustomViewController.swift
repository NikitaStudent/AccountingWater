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
        
        //Custom bar
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        toolBar.barStyle = .default
        toolBar.sizeToFit()

        // adding button "Done"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonTapped))
        toolBar.items = [doneButton]
        toolBar.isUserInteractionEnabled = true
        startTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonTapped(){
        view.endEditing(true)
    }
    
    @IBAction func CloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
