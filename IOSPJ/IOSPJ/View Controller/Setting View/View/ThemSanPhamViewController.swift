//
//  ThemSanPhamViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/11/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ThemSanPhamViewController: UIViewController {

    
    @IBOutlet weak var tenSanPhamTextField: UITextField!
    @IBOutlet weak var giaVonTextField: UITextField!
    @IBOutlet weak var giaLeTextField: UITextField!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Test")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let tenSP = tenSanPhamTextField.text, let giaVon = giaVonTextField.text, let giaBan = giaVonTextField.text {
            if let button = sender as? UIBarButtonItem, button === btnSave{
                UploadDatabaseSanPham(tensanpham: tenSP, giaVon: giaVon, giaLe: giaBan)
            }
        }
    }
    
    // MARK: Them san pham len database
    func UploadDatabaseSanPham(tensanpham:String, giaVon:String, giaLe:String) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("sanpham").addDocument(data: [
            "tensanpham": "\(tensanpham)",
            "gianhap": "\(giaVon)",
            "giaban": "\(giaLe)"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }

}
