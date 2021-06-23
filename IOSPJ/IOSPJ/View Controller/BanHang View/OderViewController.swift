//
//  OderViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/9/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class OderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let db = Firestore.firestore()
    var ban = ""
    
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var btnTraBan: UIButton!
    @IBOutlet weak var btnThanhToan: UIButton!
    
    var listSanPham = [SanPham]()
    private let database = Database.database().reference()
    var ref = Database.database().reference()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Lay du lieu tu man hinh BanHangViewcontroller
        
        //doc du lieu tu firestore
        db.collection("sanpham").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    //print("Test: \(document.data()["tensanpham"] as? String ?? "")")
                    let tenSanPham = document.data()["tensanpham"] as? String ?? ""
                    let giaBan = document.data()["giaban"] as? String ?? ""
                    let giaNhap = document.data()["gianhap"] as? String ?? ""
                    let soLuongOder = document.data()["soluongoder"] as? String ?? ""
                    
                    if let sanPham = SanPham(tenSanPham: tenSanPham, soLuongOder: soLuongOder, giaVon: giaNhap, giaBan: giaBan) {
                        self.listSanPham.append(sanPham)
                        
                        let row = self.listSanPham.count
                        let indexPath = IndexPath(row: row-1, section: 0)
                        self.tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                }
                self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "OderTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "OderTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSanPham.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OderTableViewCell", for: indexPath) as! OderTableViewCell
        cell.tenMonLabel?.text = listSanPham[indexPath.row].tenSanPham
        cell.soLuongLabel?.text = listSanPham[indexPath.row].soLuongOder
        cell.giaBanLabel?.text = listSanPham[indexPath.row].giaBan
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //print("Test : \(indexPath.row)")
        
        let abc = UIStoryboard(name: "Main", bundle: nil)
        let soLuong = abc.instantiateViewController(withIdentifier: "soluong") as! OderSoLuongViewController
        soLuong.tenSanPham = listSanPham[indexPath.row].tenSanPham
        soLuong.ban = ban
        
        soLuong.dong = "\(indexPath.row)"
        self.navigationController?.pushViewController(soLuong, animated: true)
    }

    
    /*
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
 */
    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func traBanTapped(_ sender: Any) {
        
    }
    
    @IBAction func unWinFromOder(sender: UIStoryboardSegue){
        if let sourceController = sender.source as? OderSoLuongViewController{
            let soLuong = sourceController.soLuong as String
            let dong = Int(sourceController.dong as String)
   
            listSanPham[dong!].soLuongOder = soLuong
            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
        }
    }
    
    @IBAction func unWinFromOder2(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func thanhToanTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let thanhtoan = sb.instantiateViewController(withIdentifier: "thanhtoan") as! ThanhToanViewController
        var list = [Oder]()
        var listThanhToan = [SanPham]()
        
        let allPlaces = ref.child("oder2").child(ban)
        
        allPlaces.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let soluong = snap.value as? String ?? ""
                list.append(Oder(tenSanPham: snap.key, soLuong: soluong)!)
            }
            
            var i = 0
        
            while i < list.count{
                var j = 0
                while j < self.listSanPham.count{
                    if list[i].tenSanPham == self.listSanPham[j].tenSanPham{
                        self.listSanPham[j].soLuongOder = list[i].soLuong
                        listThanhToan.append(self.listSanPham[j])
                    }
                    j+=1
                }
                i = i + 1
            }
            
            thanhtoan.listSP = listThanhToan
            thanhtoan.ban = self.ban
            self.navigationController?.pushViewController(thanhtoan, animated: true)
        })
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //print("Test")
        var ref: DatabaseReference!
        ref = Database.database().reference()
        if let button = sender as? UIBarButtonItem, button === btnSave{
            var i = 0
            var kiemTra:Int = 0
            while i < listSanPham.count {
                
                if listSanPham[i].soLuongOder != "0", listSanPham[i].soLuongOder != ""{
                    kiemTra = kiemTra + 1
                    ref.child("oder2").child(ban).child(listSanPham[i].tenSanPham).setValue(listSanPham[i].soLuongOder)
                }
                i = i + 1
            }
            if kiemTra == 0{
                ref.child("ban2").child(ban).setValue("0")
            }else{
                ref.child("ban2").child(ban).setValue("1")
            }
        }
        if let button2 = sender as? UIButton, button2 === btnTraBan{
            ref.child("ban2").child(ban).setValue("0")
            ref.child("oder2").child(ban).removeValue()
        }
    }
}
