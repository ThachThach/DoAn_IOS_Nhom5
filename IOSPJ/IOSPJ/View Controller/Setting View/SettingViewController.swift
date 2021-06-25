//
//  SettingViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/3/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class SettingViewController: UIViewController {
    
    var email = String()
    @IBOutlet weak var thonTinUser: UIButton!
    @IBOutlet weak var sanPhamButton: UIButton!
    @IBOutlet weak var soDoPhongButton: UIButton!
    @IBOutlet weak var quanLyNhanVien: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    let db = Firestore.firestore()
    var listNhanVien = [NhanVien]()
    var chucVuTime = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        var em = String()
        if email != nil{
            em = email
        }
        print("Test dsfsdf\(em)")
        
        db.collection("nhanvien").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let tenNhanVien = document.data()["tennhanvien"] as? String ?? ""
                    let chucvu = document.data()["chucvu"] as? String ?? ""
                    let calam = document.data()["calam"] as? String ?? ""
                    let email = document.data()["email"] as? String ?? ""
                    
                    if em == email {
                        self.chucVuTime = document.data()["chucvu"] as? String ?? ""
                    }
                    if let nhanVien = NhanVien(id: document.documentID,tenNhanVien: tenNhanVien, chucVu: chucvu, email: email, calam: calam){
                        self.listNhanVien.append(nhanVien)
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func quanLyNhanVienTapped(_ sender: Any) {
        if chucVuTime == "1"{
            let quanlynhanvien = self.storyboard?.instantiateViewController(withIdentifier: "nhanvien") as? NhanVienViewController
            
            if let navigator = self.navigationController {
                navigator.pushViewController(quanlynhanvien!, animated: true)
            }
        }
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
    
    @IBAction func thongTinUsertapped(_ sender: Any) {
        let thongtin = self.storyboard?.instantiateViewController(withIdentifier: "thongtin") as? ThongTinUserViewController
        thongtin?.email = email as? String ?? ""
        //let email = self.email
        if let navigator = self.navigationController {
            navigator.pushViewController(thongtin!, animated: true)
        }
    }
    @IBAction func thongTinUserTapped(_ sender: Any){
        
    }
    
    @IBAction func unWinFromSetting(sender: UIStoryboardSegue){

    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
