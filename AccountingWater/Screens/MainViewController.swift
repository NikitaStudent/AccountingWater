//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 01.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.

//image: UIImage(named: "button")

import UIKit

class MainViewController: UIViewController, AddScreenDelegate, CustomViewDelegate {
    //IBOutlet
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var startLabel: UILabel!
    
    var max = GlobalState.finish
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        
        //Settings Progress View
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        
        //navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Daily norm", style: .plain, target: self, action: #selector(nextButton))
    }
    
    @objc func nextButton() {
        let addFinish = FinishViewController()
        navigationController?.pushViewController(addFinish, animated: true)
        addFinish.delegate = self
    }

    func addScreenFinished(data: Int) {
        finishLabel.text = "\(data) ml" as String
    }
    func customViewStart(startdata: Int){
        startLabel.text = "\(startdata) ml" as String
    }
    
    //Custom screen
    @IBAction func addButton(_ sender: Any) {
        let customView = CustomViewController()
        navigationController?.pushViewController(customView, animated: true)
        customView.delegateStart = self
    }

    @IBAction func сoffeeButton(_ sender: AnyObject) {
        if GlobalState.start <= GlobalState.finish {
            let ratio = Float(GlobalState.start) / Float(GlobalState.finish)
            switch sender.tag {
                case 1:
                    GlobalState.start+=50
                case 2:
                    GlobalState.start+=200
                case 3:
                    GlobalState.start+=200
                case 4:
                        GlobalState.start+=200
                case 5:
                        GlobalState.start+=150
                case 6:
                        GlobalState.start+=25
                case 7:
                        GlobalState.start+=100
                case 8:
                        GlobalState.start+=250
                case 9:
                        GlobalState.start+=50
            default:
                print("never")
            }
            progressView.progress = Float(ratio)
            startLabel.text = "\(GlobalState.start) ml"
            finishLabel.text = "\(GlobalState.finish) ml"
        }
    }
}

