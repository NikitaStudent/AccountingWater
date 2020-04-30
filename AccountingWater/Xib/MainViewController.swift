//
//  MainViewController.swift
//  AccountingWater
//
//  Created by Никита on 29.04.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let Speed : Float = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }

    
    @IBAction func NormalButton(_ sender: Any) {
        let AdditionalViewController = AddViewController()
        navigationController?.pushViewController(AdditionalViewController, animated: true)
    }
    @IBOutlet weak var ProgressView: UIProgressView!
    @IBAction func CoffeeButton(_ sender: Any) {

    }
    


}
