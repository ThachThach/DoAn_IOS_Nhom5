//
//  MainViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/2/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var btnCaiDat: UIButton!
    var email = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Test \(email)")
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func settingTapped(_ sender: Any) {
        let setting = self.storyboard?.instantiateViewController(withIdentifier: "setting2") as? SettingViewController
        setting?.email = email as? String ?? ""
        //let email = self.email
        if let navigator = self.navigationController {
            navigator.pushViewController(setting!, animated: true)
        }
    }
    
    @IBAction func unWinFromHome(sender: UIStoryboardSegue){
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         super.prepare(for: segue, sender: sender)
        
    }
}
