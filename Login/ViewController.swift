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
    @IBOutlet weak var passwordField: UITextField!

    var securePassword: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    @IBAction func securePasswordClicked() {
        securePassword = !securePassword
    }
    
    func updateUI() {
        passwordLabel.text = securePassword ? "Secure Password" : "Password"
        passwordField.secureTextEntry = securePassword
    }

}
