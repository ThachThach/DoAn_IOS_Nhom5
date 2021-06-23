//
//  ThanhToanViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/21/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import Firebase

class ThanhToanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tongTienLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnXacNhan: UIButton!
    
    var listThuChi = [Dictionary<String, Any>]()
    var ban = String()
    var listSP = [SanPham]()
    var tong:Int = 0
    var von:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for e in listSP{
            let soluong:Int = Int(e.soLuongOder)!
            let gia:Int = Int(e.giaBan)!
            let giaVon:Int = Int(e.giaVon)!
            let nhanVon = soluong * giaVon
            let nhan = soluong * gia
            tong += nhan
            von += nhanVon
        }
        tongTienLabel?.text = "\(tong)"
        
        
        let nib = UINib(nibName: "ThanhToanTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ThanhToanTableViewCell")
        tableView.dataSource = self
        tableView.dataSource = self
        
    }
    
    //MARK: Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThanhToanTableViewCell", for: indexPath) as! ThanhToanTableViewCell
        cell.tenSanPhamLabel?.text = listSP[indexPath.row].tenSanPham
        cell.soLuongLabel?.text = listSP[indexPath.row].soLuongOder
        cell.giaLabel?.text = listSP[indexPath.row].giaBan
        
        let soluong:Int = Int(listSP[indexPath.row].soLuongOder)!
        let gia:Int = Int(listSP[indexPath.row].giaBan)!
        
        let tong = soluong * gia
        print("test tong: \(tong)")
        
        cell.tongLabel?.text = "\(tong)"
        
        return cell
    }
    

    @IBAction func xacNhanTapped(_ sender: Any) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("ban2").child(ban).setValue("0")
        ref.child("oder2").child(ban).removeValue()
        var tongloi = 0;
        var tongthu = 0;
        var tongvon = 0;
        
        //set thu chi
        var date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        
        print("Test \(month)")
        ref.child("thuchi").child("thang\(month)").observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.key as? String ?? ""
                
                if placeDict == "tongthu"{
                    let a = snap.value as? String ?? ""
                    tongthu =  (a as NSString).integerValue
                    //print("Test thu: \(tongthu)");
                }else if placeDict == "tongvon"{
                    let a = snap.value as? String ?? ""
                    tongvon =  (a as NSString).integerValue
                }else if placeDict == "tongloi"{
                    let a = snap.value as? String ?? ""
                    tongloi =  (a as NSString).integerValue
                }
                
           }
            tongvon += self.von
            tongthu += self.tong
            tongloi = tongthu - tongvon
            ref.child("thuchi").child("thang\(month)").child("tongthu").setValue(tongthu)
            ref.child("thuchi").child("thang\(month)").child("tongvon").setValue(tongvon)
            ref.child("thuchi").child("thang\(month)").child("tongloi").setValue(tongloi)
            
       })
        //ref.child("thuchi").child("thang\(month)").child("tongthu").setValue("")
 
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
