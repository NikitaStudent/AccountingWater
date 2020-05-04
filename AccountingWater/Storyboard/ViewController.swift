//
//  ViewController.swift
//  AccountingWater
//
//  Created by Никита on 13.04.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var Tap: UITapGestureRecognizer!
    
let progress = Progress(totalUnitCount: 2000)
    
    @IBOutlet weak var ProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
   
    @IBOutlet weak var FirstView: UIView!
    
}

