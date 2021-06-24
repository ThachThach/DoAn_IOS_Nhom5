//
//  SanPhamViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/10/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SanPhamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //let data = ["sp1","sp2", "sp3", "sp4", "sp5", "sp6", "sp7"]
    private let database = Database.database().reference()
    let db = Firestore.firestore()
    var listSanPham = [SanPham]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let nib = UINib(nibName: "SanPhamTableViewCell", bundle: nil)
//        
        tableView.register(nib, forCellReuseIdentifier: "SanPhamTableViewCell")
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSanPham.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SanPhamTableViewCell", for: indexPath) as! SanPhamTableViewCell
        
        cell.tenSanPhamLabel?.text = listSanPham[indexPath.row].tenSanPham
        cell.giaVonLabel?.text = listSanPham[indexPath.row].giaVon
        cell.giaLeLabel?.text = listSanPham[indexPath.row].giaBan
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //print("Test : \(indexPath.row)")
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sp = sb.instantiateViewController(withIdentifier: "editsanpham") as! EdiSanPhamViewController
    
        sp.tenSanPham = listSanPham[indexPath.row].tenSanPham
        sp.giaLe = listSanPham[indexPath.row].giaVon
        sp.giaVon = listSanPham[indexPath.row].giaVon
        self.navigationController?.pushViewController(sp, animated: true)
    }
    

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unWinFromSanPham(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func unWinFromSanPham2(sender: UIStoryboardSegue){
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
