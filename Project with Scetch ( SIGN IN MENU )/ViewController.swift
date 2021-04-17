//
//  ViewController.swift
//  Project with Scetch ( SIGN IN MENU )
//
//  Created by Moobat on 1/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atributesString()
    }

    func atributesString() {
        let atributeString = NSAttributedString(string: "FORGOT PASSWORD ?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.underlineStyle: 1])
        forgotPasswordButton.setAttributedTitle(atributeString, for: .normal)
    }
    
}

