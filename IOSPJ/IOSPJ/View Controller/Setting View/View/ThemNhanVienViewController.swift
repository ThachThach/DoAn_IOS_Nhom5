//
//  ThemNhanVienViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/24/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

class ThemNhanVienViewController: UIViewController {

    @IBOutlet weak var tenNhanVientextFiels: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var phucVuCheck: UILabel!
    @IBOutlet weak var quanLyCheck: UILabel!
    @IBOutlet weak var bepbarCheck: UILabel!
    @IBOutlet weak var caSangLabel: UILabel!
    @IBOutlet weak var caChieuLabel: UILabel!
    @IBOutlet weak var caToiLabel: UILabel!
    @IBOutlet weak var fullTimeLabel: UILabel!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    
    let db = Firestore.firestore()
    var checkChucVu = "1"
    var calamViec = "sang"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func checKQuanLy(_ sender: Any) {
        bepbarCheck.text = "○"
        quanLyCheck.text = "◉"
        phucVuCheck.text = "○"
        checkChucVu = "1"
    }
    
    @IBAction func checkBepbar(_ sender: Any) {
        bepbarCheck.text = "◉"
        quanLyCheck.text = "○"
        phucVuCheck.text = "○"
        checkChucVu = "3"
    }
    
    @IBAction func checkPhucVu(_ sender: Any) {
        bepbarCheck.text = "○"
        quanLyCheck.text = "○"
        phucVuCheck.text = "◉"
        checkChucVu = "2"
    }
    
    @IBAction func checkCaSang(_ sender: Any) {
        caSangLabel.text = "◉"
        caChieuLabel.text = "○"
        caToiLabel.text = "○"
        fullTimeLabel.text = "○"
        calamViec = "sang"
    }
    
    @IBAction func checkCaChieu(_ sender: Any) {
        caSangLabel.text = "○"
        caChieuLabel.text = "◉"
        caToiLabel.text = "○"
        fullTimeLabel.text = "○"
        calamViec = "chieu"
    }
    
    @IBAction func checkCaToi(_ sender: Any) {
        caSangLabel.text = "○"
        caChieuLabel.text = "○"
        caToiLabel.text = "◉"
        fullTimeLabel.text = "○"
        calamViec = "toi"
    }
    
    @IBAction func checkFullTime(_ sender: Any) {
        caSangLabel.text = "○"
        caChieuLabel.text = "○"
        caToiLabel.text = "○"
        fullTimeLabel.text = "◉"
        calamViec = "fulltime"
        
    }
    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
         dismiss(animated: true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if tenNhanVientextFiels.text != "" , emailTextField.text != "", passwordTextField.text != ""{
            let tenNhanVien = tenNhanVientextFiels.text as? String ?? ""
            let email = emailTextField.text as? String ?? ""
            let password = passwordTextField.text as? String ?? ""
            Auth.auth().createUser(withEmail: email, password: password){ (resuls, err) in
                var ref: DocumentReference? = nil
                ref = self.db.collection("nhanvien").addDocument(data: [
                    "calam": "\(self.calamViec)",
                    "chucvu": "\(self.checkChucVu)",
                    "tennhanvien": "\(tenNhanVien)",
                    "email": "\(email)"
                ]){err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
        else{
            
        }
    }
}
