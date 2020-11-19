//
//  ViewController.swift
//  ToastDemo
//
//  Created by Amr Hesham on 11/19/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showToastButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showToastAction(_ sender: Any) {
        ToastView.showToast(to: self.view)
    }
    
}

