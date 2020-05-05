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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var ViewForButton: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        
        
        // MAKE : Progress View
    progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        //self.ViewForProgress.backgroundColor = UIColor(red: 174.0/255.0, green: 255.0/255.0, blue: 179.0/255.0, alpha: 1.0)
        // MAKE: Navigation Controll
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Daily norm", style: .plain, target: self, action: #selector(nextButton))
        ViewForButton.layer.cornerRadius = 10
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

    
    //self.progressView.progress += +0.2
    
    
    
    
    

  
    
    
    
}
