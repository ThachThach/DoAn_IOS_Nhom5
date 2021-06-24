//
//  SettingViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/3/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {
    
    @IBOutlet weak var sanPhamButton: UIButton!
    @IBOutlet weak var soDoPhongButton: UIButton!
    @IBOutlet weak var quanLyNhanVien: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
//        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "startvc") as? ViewController
//        self.view.window?.rootViewController = storyboard
//        self.view.window?.makeKeyAndVisible()
        
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "startvc") as? ViewController
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        if let navigator = self.navigationController {
            navigator.pushViewController(homeViewController!, animated: true)
        }
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
