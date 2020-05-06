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
    @IBOutlet weak var StartLabel: UILabel!
    let max = Global.Finish
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        
        
        // MAKE :Settings Progress View
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        
        // MAKE: Navigation Controll
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Daily norm", style: .plain, target: self, action: #selector(nextButton))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func nextButton() {
            let AddFinish = FinishViewController()
        navigationController?.pushViewController(AddFinish, animated: true)
         AddFinish.delegate = self
    }
    
    func addScreenFinished(data: String) {
        FinishLabel.text = data
    }
    
    @IBAction func AddButton(_ sender: Any) {
        let CustomView = CustomViewController()
        navigationController?.pushViewController(CustomView, animated: true)
    }
    //self.progressView.progress += +0.2
    @IBAction func CoffeeButton(_ sender: AnyObject) {
        let i = Global.Start
        if i <= max {
            // Compute ratio of 0 to 1 for progress.
            let ratio = Float(i) / Float(max)
            progressView.progress = Float(ratio)
            StartLabel.text = "\(i)"
            FinishLabel.text = "\(max)"
            Global.Start+=200
        }
    }

}
