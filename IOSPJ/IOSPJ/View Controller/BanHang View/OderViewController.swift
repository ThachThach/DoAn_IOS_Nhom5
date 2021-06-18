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
    
    var listSanPham = [SanPham]()
    private let database = Database.database().reference()
    
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
        print("ABC: \(listSanPham)")
        cell.giaBanLabel?.text = listSanPham[indexPath.row].giaBan
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Test: \(indexPath.row)")
        
        let abc = UIStoryboard(name: "Main", bundle: nil)
        let soLuong = abc.instantiateViewController(withIdentifier: "soluong") as! OderSoLuongViewController
        soLuong.tenSanPham = listSanPham[indexPath.row].tenSanPham
        soLuong.ban = ban
        soLuong.dong = "\(indexPath.row)"
        self.navigationController?.pushViewController(soLuong, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
    
    @IBAction func unWinFromOder(sender: UIStoryboardSegue){
        if let sourceController = sender.source as? OderSoLuongViewController{
            let soLuong = sourceController.soLuong as String
           // listSanPham[dong].soLuongOder = soLuong
            if let selectedIndexpath = tableView.indexPathForSelectedRow{
                listSanPham[selectedIndexpath.row].soLuongOder = soLuong
                tableView.reloadRows(at: [selectedIndexpath], with: .none)
            }
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //print("Test")
        if let button = sender as? UIBarButtonItem, button === btnSave{
            let date = Date()
//            var object: [String: Any] = [
//                "sanpham" : "",
//                "thoigian" : "\(date)"
//            ]
//
//            var i = 0
//            while i < listSanPham.count {
//                let itemSanPham = [
//                    "\(listSanPham[i].tenSanPham)" :[
//                        "soluong" : listSanPham[i].soLuongOder,
//                        "giaban" : listSanPham[i].giaBan
//                    ]
//                ]
//
//                // get existing items, or create new array if doesn't exist
//                object["sanpham"] = (object["sanpham"] as? [[String: Any]] ?? []) + [itemSanPham]
//                i = i + 1
//            }
//
//            print("Test: \(object)")
//
//
//
//            let ref2 = database.child("oder").child("\(ban)")
//
//            ref2.setValue(object)
            
            let ref2 = database.child("oder2").child("\(ban)")
            
            var object = [Dictionary<String, Any>]()
            var i = 0
            while i < listSanPham.count {
                
                object.append(["\(listSanPham[i].tenSanPham)" : "\(listSanPham[i].soLuongOder)", "thoigian" : "\(date)"])
                i = i + 1
            }
            ref2.setValue(object)
            print("Test \(object)")
        }
    }
}
