//
//  AppDelegate.swift
//  AccountingWater
//
//  Created by Никита on 13.04.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootViewController = MainViewController()
       let navigationController = UINavigationController(rootViewController: rootViewController)
        UINavigationBar.appearance().barTintColor = UIColor(red: 174.0/255.0, green: 255.0/255.0, blue: 179.0/255.0, alpha: 1.0)
       // UINavigationBar.appearance().shadowImage = UIImage()
        window?.rootViewController = navigationController
    
        
        return true
    }

    


}

