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
    var max = Global.Finish
    let userQueue = DispatchQueue.global(qos: .unspecified)
    let background = DispatchQueue.global(qos: .background)
    
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
    
    func addScreenFinished(data: Int) {
        FinishLabel.text = "\(data)" as String
    }
    
    @IBAction func AddButton(_ sender: Any) {
        let CustomView = CustomViewController()
        navigationController?.pushViewController(CustomView, animated: true)
    }
    //self.progressView.progress += +0.2
    @IBAction func CoffeeButton(_ sender: UIButton) {
        //let i = Global.Start
        if Global.Start <= Global.Finish {
            // Compute ratio of 0 to 1 for progress.
            let ratio = Float(Global.Start) / Float(Global.Finish)
            progressView.progress = Float(ratio)
            StartLabel.text = "\(Global.Start) ml"
            FinishLabel.text = "\(Global.Finish) ml"
           // Global.Start+=200
            switch sender.tag {
            case 1:
                Global.Start+=50
                
            case 2:
                Global.Start+=200
            case 3:
                Global.Start+=200
            case 4:
                    Global.Start+=200
            case 5:
                    Global.Start+=150
            case 6:
                    Global.Start+=25
            case 7:
                    Global.Start+=100
            case 8:
                    Global.Start+=250
            case 9:
                    Global.Start+=50
            
            default:
                print("hello")
            }
        }
    }
}

