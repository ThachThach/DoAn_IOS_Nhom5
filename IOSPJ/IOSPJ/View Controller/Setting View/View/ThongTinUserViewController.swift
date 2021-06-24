//
//  ThongTinUserViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/25/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import FirebaseDatabase
import Firebase
import UIKit

class ThongTinUserViewController: UIViewController {

    var email = String()
    let db = Firestore.firestore()
    
    @IBOutlet weak var tenNhanVienLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var chucVuLabel: UILabel!
    @IBOutlet weak var caLamLabel: UILabel!
    @IBOutlet weak var image: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Test hthongting \(email)")
        db.collection("nhanvien").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let em = document.data()["email"] as? String ?? ""
                    if self.email == em{
                        let tenNhanVien = document.data()["tennhanvien"] as? String ?? ""
                        let chucvu = document.data()["chucvu"] as? String ?? ""
                        let calam = document.data()["calam"] as? String ?? ""
                        
                        self.tenNhanVienLabel?.text = tenNhanVien
                        self.emailLabel?.text = em
                        
                        if chucvu == "1"{
                            self.image?.text = "🕵🏻‍♂️"
                            self.chucVuLabel?.text = "Quan ly"
                        }else if chucvu == "2"{
                            self.image?.text = "🤵🏼"
                            self.chucVuLabel?.text = "Phuc vu"
                        }else if chucvu == "3"{
                            self.image?.text = "👨🏻‍🍳"
                            self.chucVuLabel?.text = "Bepbar"
                        }
                        self.caLamLabel?.text = calam
                        
                        break
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
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
