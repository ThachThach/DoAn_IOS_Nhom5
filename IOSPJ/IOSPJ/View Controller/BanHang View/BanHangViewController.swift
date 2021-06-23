//
//  BanHangViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/3/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import Firebase

class BanHangViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    private let database = Database.database().reference()
    var listBan =  [BanOder]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child("ban2").observe(.childAdded, with: { (snapshot) -> Void in

            let key = snapshot.key
            var value = snapshot.value as? String ?? ""
            
            if value != "0" {
                value = "true"
            }
            
            if let oder = BanOder(tenBan: key, trangThai: value){
                self.listBan.append(oder)
                
                let row = self.listBan.count
                let indexPath = IndexPath(row: row-1, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        })
        
        let nib = UINib(nibName: "BanHangTableViewCell", bundle: nil)
        
        self.tableView.register(nib, forCellReuseIdentifier: "BanHangTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK: lay du lieu
    func getData() {
        ref = Database.database().reference()
        var i = 0
        ref.child("ban2").observe(.childAdded, with: { (snapshot) -> Void in
            
            if i == 0 {
                
                self.listBan.removeAll()
                i = i + 1
            }
            //print("Test: \(snapshot.childSnapshot(forPath: "tenban").value)")
            
            let key = snapshot.key
            var value = snapshot.value as? String ?? ""
            
            if value != "0" {
                value = "true"
            }
            
            
            if let oder = BanOder(tenBan: key, trangThai: value){
                self.listBan.append(oder)
            }
            self.tableView.reloadData()
        })
    }
    
    //MARK: refresh data
    
    @IBAction func refresh(_ sender: Any) {
        getData()
    }
    
    
    //MARK: tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BanHangTableViewCell", for: indexPath) as! BanHangTableViewCell
        cell.tenBanLabel?.text = listBan[indexPath.row].tenBan
        cell.trangThaiLabel?.text = listBan[indexPath.row].trangThai
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let oderView = sb.instantiateViewController(withIdentifier: "oder") as! OderViewController
        oderView.ban = listBan[indexPath.row].tenBan
    self.navigationController?.pushViewController(oderView, animated: true)
    }
    
    
    @IBAction func unWinFromBanHang(sender: UIStoryboardSegue){
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("Test: aaaaas")
//        var banOder:String?
//        if let selectedCell = sender as? BanHangTableViewCell {
//            banOder = selectedCell.tenBanLabel.text ?? ""
//        }
//        if let destinationController = segue.destination as? OderViewController{
//            destinationController.ban = ""
//        }
//
    //    }
}
