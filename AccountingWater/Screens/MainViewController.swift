//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 01.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.

//image: UIImage(named: "button")

import UIKit
import UserNotifications

class MainViewController: UIViewController, AddScreenDelegate, CustomViewDelegate {
    //IBOutlet
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var startLabel: UILabel!
    
    var max = GlobalState.finish
    let notifId = "myNotif"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        requestPermission()
        
        //Settings Progress View
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        
        //navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Daily norm", style: .plain, target: self, action: #selector(nextButton))
        
    }
    func requestPermission(){
        let options = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Unable to get the permission ", error)
                return
            }
            
        }
    }
    
    @objc func nextButton() {
        let addFinish = FinishViewController()
        navigationController?.pushViewController(addFinish, animated: true)
        addFinish.delegate = self
    }

    func addScreenFinished(data: Int) {
        finishLabel.text = "\(data) ml" as String
    }
    
    //Custom screen
    @IBAction func addButton(_ sender: AnyObject) {
        let customView = CustomViewController()
        customView.modalPresentationStyle = .pageSheet
        present(customView, animated: true, completion: nil)
        customView.delegateStart = self
    }
    
    func customViewStart(startdata: Int){
        startLabel.text = "\(GlobalState.start) ml" as String
    }
    
    @IBAction func notifButton(_ sender: Any) {
        scheduleNotification(title: "Water Time!!!", subtitle: "Thirst??", body: "Time to drink a glass of water", inSeconds: 2, repeater: false)
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
    func scheduleNotification(title: String, subtitle: String, body: String, inSeconds: TimeInterval, repeater: Bool) {
          let localNotification = UNMutableNotificationContent()
          localNotification.title = title
          localNotification.subtitle = subtitle
          localNotification.body = body
          
          let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: repeater)
          
          let request = UNNotificationRequest(identifier: notifId, content: localNotification, trigger: notificationTrigger)
          UNUserNotificationCenter.current().add(request) { (error) in
              if let error = error {
                  print("Creating notification failed ", error)
                  
                  return
              }
              
          }
          
      }
}

