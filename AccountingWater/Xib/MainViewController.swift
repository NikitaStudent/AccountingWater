//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 01.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

class MainViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "button"), style: .plain, target: self, action: #selector(nextButton))
        title = "Main"
        let maximal: Float
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    @objc func nextButton() {
            let AdditionalViewController = AddViewController()
                    navigationController?.pushViewController(AdditionalViewController, animated: true)

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
        self.progressView.progress += +0.2
    }
    
    
    
    
    
    
    

  
    
    
    
}
