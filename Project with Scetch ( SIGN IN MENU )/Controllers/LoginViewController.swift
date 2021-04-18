//
//  ViewController.swift
//  Project with Scetch ( SIGN IN MENU )
//
//  Created by Moobat on 1/30/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let segueIdentifier = "taskSegue"
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var warnLable: UILabel!
    @IBOutlet weak var gmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atributesString()
        warnLable.alpha = 0
        
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: (self?.segueIdentifier)!, sender: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gmailTextField.text = ""
        passwordTextField.text = ""
    }
    
    func displayWrnLable(withText text: String) {
        warnLable.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: { [weak self] in
            self?.warnLable.alpha = 1
        }) { [weak self] complete in
            self?.warnLable.alpha = 0
        }
    }
    
    @IBAction func signinButtonAction(_ sender: UIButton) {
        guard let gmail = gmailTextField.text,
              let password = passwordTextField.text,
                    gmail != "",
                    password != "" else {
            displayWrnLable(withText: "Info is incorect")
            return
        }
        
        Auth.auth().signIn(withEmail: gmail, password: password) { [weak self] (user, error)
            in
            if error != nil {
                self?.displayWrnLable(withText: "Error occured")
                return
            }
            
            if user != nil {
                self?.performSegue(withIdentifier: "taskSegue", sender: nil)
                return
            }
            
            self?.displayWrnLable(withText: "No such user")
        }
    }
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        guard let gmail = gmailTextField.text,
              let password = passwordTextField.text,
                    gmail != "",
                    password != "" else {
            displayWrnLable(withText: "Info is incorect")
            return
        }
        
        Auth.auth().createUser(withEmail: gmail, password: password) { (user, error) in
            if error == nil {
                if user != nil {
                    
                } else {
                    print("user is not created")
                }
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    

    func atributesString() {
        let atributeString = NSAttributedString(string: "FORGOT PASSWORD ?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.underlineStyle: 1])
        forgotPasswordButton.setAttributedTitle(atributeString, for: .normal)
    }
    
}

