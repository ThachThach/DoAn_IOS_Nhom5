//
//  EdiSanPhamViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/25/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class EdiSanPhamViewController: UIViewController {

    @IBOutlet weak var tenSanPhamTextField: UITextField!
    @IBOutlet weak var giaVonTextField: UITextField!
    @IBOutlet weak var giaLeTextField: UITextField!
    @IBOutlet weak var edtSave: UIBarButtonItem!
    
    var tenSanPham = String()
    var giaVon = String()
    var giaLe = String()
    let row = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tenSanPhamTextField.text = tenSanPham
        giaVonTextField.text = giaVon
        giaLeTextField.text = giaLe
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            super.prepare(for: segue, sender: sender)
        
    }
    
    
}
