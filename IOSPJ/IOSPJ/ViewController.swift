//
//  ViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/2/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        Auth.auth().createUser(withEmail: "a@gmail.com", password: "123456") { authResult, error in
            // ...
            print("hihi")
        }
        */
        setUpElements()
        
    }
    
    func setUpElements() {
        Utilities.styleHellowButton(signUpButton)
        Utilities.styleHellowButton(loginButton)
    }
}

