//
//  ViewController.swift
//  Project with Scetch ( SIGN IN MENU )
//
//  Created by Moobat on 1/30/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var warnLable: UILabel!
    @IBOutlet weak var gmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atributesString()
    }
    
    @IBAction func signinButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        
    }
    
    

    func atributesString() {
        let atributeString = NSAttributedString(string: "FORGOT PASSWORD ?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.underlineStyle: 1])
        registerButton.setAttributedTitle(atributeString, for: .normal)
    }
    
}

