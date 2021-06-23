//
//  OderSoLuongViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import Firebase

class OderSoLuongViewController: UIViewController {

    @IBOutlet weak var soLuongLabel: UILabel!
    @IBOutlet weak var tenSanPhamLabel: UILabel!
    @IBOutlet weak var steperSoLuonh: UIStepper!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    var ref = Database.database().reference()
    
    var ban = ""
    var soLuong = ""
    var tenSanPham = ""
    var dong = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenSanPhamLabel.text = tenSanPham
        
        
        print("ABC: \(dong)")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let button = sender as? UIBarButtonItem, button === btnSave{
            soLuong = soLuongLabel?.text as! String
            dong = "\(dong)"
        }
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        soLuongLabel.text = Int(sender.value).description
    }
    
}
