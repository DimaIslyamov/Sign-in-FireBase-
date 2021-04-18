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
    var ref: DatabaseReference!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var warnLable: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        ref = Database.database().reference(withPath: "users")
        warnLable.alpha = 0
        
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: (self?.segueIdentifier)!, sender: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    func displayWrnLable(withText text: String) {
        warnLable.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: [.curveEaseInOut],
                       animations: { [weak self]
                        in
            self?.warnLable.alpha = 1
        }) { [weak self] complete in
            self?.warnLable.alpha = 0
        }
    }
    
    @IBAction func signinButtonAction(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              email != "",
                    password != "" else {
            displayWrnLable(withText: "Info is incorect")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error)
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
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              email != "",
                    password != "" else {
            displayWrnLable(withText: "Info is incorect")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard error == nil, let user = authResult?.user else {
                print(error!.localizedDescription)
                return
            }
            let userRef = self?.ref.child(user.uid)
            userRef?.setValue(user.email, forKey: "email")
        }
    }
    
}

