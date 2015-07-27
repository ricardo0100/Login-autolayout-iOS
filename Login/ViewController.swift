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
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    var securePassword: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    @IBAction func securePasswordClicked() {
        securePassword = !securePassword
    }
    
    @IBAction func loginClicked() {
        print("Oi")
        image = UIImage(named: "foca")
    }
    
    func updateUI() {
        passwordLabel.text = securePassword ? "Secure Password" : "Password"
        passwordField.secureTextEntry = securePassword
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            if let constrainedView = imageView {
                if let newImage = newValue {
                    aspectRatio = NSLayoutConstraint(item: constrainedView,
                        attribute: .Width,
                        relatedBy: .Equal,
                        toItem: constrainedView,
                        attribute: .Height,
                        multiplier: newImage.aspectRatio,
                        constant: 0)
                } else {
                    aspectRatio = nil
                }
            }
        }
    }
    
    var aspectRatio: NSLayoutConstraint? {
        willSet {
            if let existingConstraint = aspectRatio {
                view.removeConstraint(existingConstraint)
            }
        }
        didSet {
            if let newConstraint = aspectRatio {
                view.addConstraint(newConstraint)
            }
        }
    }

}

extension UIImage {
    var aspectRatio: CGFloat {
        get {
            return size.height != 0 ? size.width / size.height : 0
        }
    }
}