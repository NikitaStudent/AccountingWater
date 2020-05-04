//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 01.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.

//image: UIImage(named: "button")

import UIKit

class MainViewController: ViewController, AddScreenDelegate {
    @IBOutlet weak var FinishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MAKE : Progress View
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        
        // MAKE: Navigation Controll
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Daily norm", style: .plain, target: self, action: #selector(nextButton))
        title = "Main"
    }
    
    func addScreenFinished(data: String) {
        FinishLabel.text = data
    }
    @objc func nextButton() {
            let AddFinish = FinishViewController()
        AddFinish.delegate = self
       present(AddFinish, animated: true, completion: nil)
    }
    

    
    
    @IBAction func AddButton(_ sender: Any) {
        let CustomView = CustomViewController()
        navigationController?.pushViewController(CustomView, animated: true)
    }
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func CoffeeButton(_ sender: Any) {
        self.progressView.progress += +0.05
    }
    @IBAction func AquaButton(_ sender: Any) {
        self.progressView.progress += +0.1
    }
    @IBAction func JuiceButton(_ sender: Any) {
        self.progressView.progress += +0.2
    }
    @IBAction func ColaButton(_ sender: Any) {
        self.progressView.progress += +0.2
    }
    @IBAction func MilkButton(_ sender: Any) {
        self.progressView.progress += +0.05
    }
    @IBAction func TeaButton(_ sender: Any) {
        self.progressView.progress += +0.15
    }
    @IBAction func YogurtButton(_ sender: Any) {
        self.progressView.progress += +0.25
    }
    @IBAction func WineButton(_ sender: Any) {
        self.progressView.progress += +0.025
    }
    @IBAction func CoctailButton(_ sender: Any) {
        //self.progressView.progress += +0.2
       
    }
    
    
    
    
    
    
    

  
    
    
    
}
