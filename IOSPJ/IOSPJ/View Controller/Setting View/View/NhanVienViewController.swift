//
//  NhanVienViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/23/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class NhanVienViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let db = Firestore.firestore()
    var listNhanVien = [NhanVien]()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                    
                    if let nhanVien = NhanVien(tenNhanVien: tenNhanVien, chucVu: chucvu, email: email, calam: calam){
                        self.listNhanVien.append(nhanVien)
                    }
                }
                
                let nib = UINib(nibName: "NhanVienTableViewCell", bundle: nil)
                self.tableView.register(nib, forCellReuseIdentifier: "NhanVienTableViewCell")
                self.tableView.delegate = self
                self.tableView.dataSource = self
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listNhanVien.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NhanVienTableViewCell", for: indexPath) as! NhanVienTableViewCell
        cell.tenNhanVienLabel?.text = listNhanVien[indexPath.row].tenNhanVien
        if listNhanVien[indexPath.row].chucVu == "1" {
            cell.iconNhanVien?.text = "🕵🏻‍♂️"
        }else if listNhanVien[indexPath.row].chucVu == "3" {
            cell.iconNhanVien?.text = "👨🏻‍🍳"
        }else if listNhanVien[indexPath.row].chucVu == "2" {
            cell.iconNhanVien?.text = "🤵🏼"
        }
        
        return cell
    }
    
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unWinFromNhanVienCancel(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func unWinFromNhanVienSave(sender: UIStoryboardSegue){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
