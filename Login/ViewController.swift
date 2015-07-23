//
//  ViewController.swift
//  Login
//
//  Created by Ricardo Gehrke Filho on 22/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UILabel!

    var securePassword: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    @IBAction func securePasswordClicked() {
        securePassword = !securePassword
    }
    
    func updateUI() {
        if securePassword {
            passwordLabel.text = "Secure Password"
        } else {
            passwordLabel.text = "Password"
        }
    }

}
