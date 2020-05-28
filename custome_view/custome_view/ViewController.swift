//
//  ViewController.swift
//  custome_view
//
//  Created by ruihao li on 2020-05-26.
//  Copyright © 2020 Homer li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func isChecked(_ sender: checkbox) {
        print("Checkbox \(sender.checked ? "checked" : "unchecked")")
    }
}

