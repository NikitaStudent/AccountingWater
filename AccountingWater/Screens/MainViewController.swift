//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 01.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.

//image: UIImage(named: "button")

import UIKit
import UserNotifications

class MainViewController: UIViewController, AddScreenDelegate, CustomViewDelegate, SettingsViewDelegate {
    
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
        
        //Settings Progress View
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        viewButton.layer.cornerRadius = 10
        
        //navigation bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "button"), style: .plain, target: self, action: #selector(nextButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButton))
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
    @objc func settingsButton() {
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: true)
        settings.settingsDelegate = self
    }
    func SettingsDelegateFinish(data: Int) {
        finishLabel.text = "/\(data) ml" as String
        progressView.progress = Float(GlobalState.start) / Float(GlobalState.finish)
    }

    func addScreenFinished(data: Int) {
        finishLabel.text = "/\(data) ml" as String
        progressView.progress = Float(GlobalState.start) / Float(GlobalState.finish)
    }
    
    //Custom screen
    @IBAction func addButton(_ sender: AnyObject) {
        let customView = CustomViewController()
        navigationController?.pushViewController(customView, animated: true)
        customView.delegateStart = self
    }
    
    func customViewStart(startdata: Int){
        startLabel.text = "\(GlobalState.start) ml" as String
        progressView.progress = Float(GlobalState.start) / Float(GlobalState.finish)
    }
    
    @IBAction func notifButton(_ sender: Any) {
        scheduleNotification(title: "Water Time!!!", body: "Time to drink a glass of water", inSeconds: 3600, repeater: false)
        // create the alert
        let alert = UIAlertController(title: "Напоминание", message: "Уведомление придет через час", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        finishLabel.text = "/\(GlobalState.finish) ml"
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

