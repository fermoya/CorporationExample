//
//  LoginViewController.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 13/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import LocalAuthentication
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginWrapperView: UIView! {didSet { loginWrapperView.layer.cornerRadius = 5.0 } }
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.layer.cornerRadius = 5.0
            userTextField.placeholder = NSLocalizedString("MAIN_USER_TEXT_FIELD_HINT", comment: "")
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.layer.cornerRadius = 5.0
            passwordTextField.placeholder = NSLocalizedString("MAIN_PASS_TEXT_FIELD_HINT", comment: "")
        }
    }
    @IBOutlet weak var logInButton: UIButton! {
        didSet {
            logInButton.layer.cornerRadius = 5.0
            logInButton.layer.borderWidth = 2.0
            logInButton.layer.borderColor = UIColor.orange.cgColor
            
            logInButton.addTarget(self, action: #selector(buttonTouchDown), for: UIControlEvents.touchDown)
            logInButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchUpInside)
            logInButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragOutside)
            logInButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragExit)
        }
    }
    @IBOutlet weak var fingerPrintButton: UIButton! {
        didSet {
            fingerPrintButton.layer.cornerRadius = 5.0
            fingerPrintButton.layer.borderWidth = 2.0
            fingerPrintButton.layer.borderColor = UIColor.orange.cgColor
            
            fingerPrintButton.addTarget(self, action: #selector(buttonTouchDown), for: UIControlEvents.touchDown)
            fingerPrintButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchUpInside)
            fingerPrintButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragOutside)
            fingerPrintButton.addTarget(self, action: #selector(buttonTouchUp), for: UIControlEvents.touchDragExit)
        }
    }
    @IBOutlet weak var fingerPrintButtonWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.view.backgroundColor = UIColor.orange
        
        if LAContext().hasTouchID() {
            fingerPrintButtonWidthConstraint.constant = 0
        }
    }
    
    func buttonTouchDown(sender: UIButton) {
        sender.backgroundColor = UIColor.orange
    }
    
    func buttonTouchUp(sender: UIButton) {
        sender.backgroundColor = UIColor.orange.withAlphaComponent(0.05)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
