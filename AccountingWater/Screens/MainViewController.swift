//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 01.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.

//image: UIImage(named: "button")

import UIKit
import UserNotifications

struct GlobalState {
   static var finish: Int = 3000
   static var start: Int = 0
}

class MainViewController: UIViewController, AddScreenDelegate, CustomViewDelegate {
    //IBOutlet
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var viewButton: UIView!
    
    var max = GlobalState.finish
    var start = GlobalState.start
    let notifId = "myNotif"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        requestPermission()
        
        //Settings Progress View
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        viewButton.layer.cornerRadius = 10
        
        //navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(nextButton))
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
    
    //Statistics screen
    @IBAction func statisticsButton(_ sender: Any) {
        let statistics = StatisticsViewController()
        navigationController?.pushViewController(statistics, animated: true)
    }
    
    //Finish screen
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
        startLabel.text = "\(start) ml" as String
    }
    
    @IBAction func notifButton(_ sender: Any) {
        scheduleNotification(title: "Water Time!!!", body: "Time to drink a glass of water", inSeconds: 5, repeater: false)
    }
    
    @IBAction func сoffeeButton(_ sender: AnyObject) {
        if start <= max {
            let ratio = Float(start) / Float(max)
            switch sender.tag {
                case 1:
                    start+=50
                case 2:
                    start+=200
                case 3:
                    start+=200
                case 4:
                    start+=200
                case 5:
                    start+=150
                case 6:
                    start+=25
                case 7:
                    start+=100
                case 8:
                    start+=250
                case 9:
                    start+=50
            default:
                print("never")
            }
            progressView.progress = Float(ratio)
            startLabel.text = "\(start) ml"
            finishLabel.text = "\(max) ml"
        }
    }
    
    func scheduleNotification(title: String, body: String, inSeconds: TimeInterval, repeater: Bool) {
          let localNotification = UNMutableNotificationContent()
          localNotification.title = title
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

