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
    
        let myData = ["first", "first1", "first2", "first3", "first4", "first5"]
    var ref: DatabaseReference!
    private let database = Database.database().reference()
    
    var posData = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        
        //doc du lieu tu firebase realtime
        /*
        ref.child("ban").observe(.childAdded, with: { (snapshot) -> Void in
            //print("Test: \(snapshot.childSnapshot(forPath: "tenban").value)")
            let value = snapshot.value as? NSDictionary
            let tenBan = value?["tenban"] as? String ?? ""
            let trangThai = value?["trangthai"] as? String ?? ""
        
            print("Test: \(tenBan)");
            print("Test: \(trangThai)");
        })
        */
        
        var i = 1
        repeat {
            //var banID = Auth.auth().currentUser?.uid
            var ban = "hoanghuulong\(i)"
            var trangThai = "1"
            
            self.ref.child("ban").child(ban).setValue(["tenban": ban])
            self.ref.child("ban").child(ban).setValue(["trangthai": trangThai])
            i = i + 1
        } while  i <= 5
        
        
        
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "OderTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "OderTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OderTableViewCell", for: indexPath) as! OderTableViewCell
        cell.tenMonLabel?.text = myData[indexPath.row]
        return cell
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celloder", for: indexPath)
        return cell
    }
*/
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


/*
 
 let userID = Auth.auth().currentUser?.uid
 ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
 // Get user value
 let value = snapshot.value as? NSDictionary
 username = value?["username"] as? String ?? ""
 print("Test1: \(value)")
 // ...
 }) { (error) in
 print(error.localizedDescription)
 }
 
 */
