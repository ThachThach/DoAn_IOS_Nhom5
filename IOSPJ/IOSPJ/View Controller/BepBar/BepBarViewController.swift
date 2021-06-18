//
//  BepBarViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/8/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BepBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var expertise = [Dictionary<String, Any>]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()
//        ref.child("oder2").observe(.childAdded, with: { (snapshot) -> Void in
//            //print("Test \(snapshot.value as? [String: Any])")
//            let value = snapshot.value as? NSDictionary
//            let vl = value?.allValues as? NSDictionary
//            print("Test 2  \(value)")
//
//        })
        
        let allPlaces = ref.child("oder2")
        
        allPlaces.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                //let placeDict = snap.value as! [String: Any]
                //let info = placeDict["sting"] as! String
                //let moreInfo = placeDict["moreinfo"] as! String
                print("test: \(snap.childSnapshot(forPath: "sting"))")
            }
        })
        
        
//            ref.child("oder2").observe(DataEventType.value, with: { (snapshot) in
//                let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//                print("Test: \(postDict)")
//            })
        
        
        
        
//        db.collection("oder").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//
//                    //print("\(document.documentID) => \(document.data())")
//                    //print("Test: \(document.data()["tensanpham"] as? String ?? "")")
//                    let tenSanPham = document.data()["tensanpham"] as? String ?? ""
//                    let giaBan = document.data()["giaban"] as? String ?? ""
//                    let giaNhap = document.data()["gianhap"] as? String ?? ""
//                    let soLuongOder = document.data()["soluongoder"] as? String ?? ""
//
//                    print("Test \(document.data())")
//                }
//            }
//        }
        
        
        
        
        self.view.backgroundColor = .clear
        createDataSource()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "BepBarTableViewCell", bundle: nil), forCellReuseIdentifier: "BepBarTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
 
    func createDataSource() {
        expertise.append(["title": "IOS", "value": ["Long1", "Long2", "Long3"]])
        expertise.append(["title": "Android", "value": ["Long4", "Long5", "Long6"]])
        expertise.append(["title": "C#", "value": ["Long7", "Long8", "Long9"]])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(expertise[indexPath.row]["title"])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expertise.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let codeName = expertise[section]["value"] as? [String] else {
            return 0
        }
        return codeName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BepBarTableViewCell") as! BepBarTableViewCell
        guard let codeName = expertise[indexPath.section]["value"] as? [String] else {
            return cell
        }
        cell.setTenBan(_tenBan: codeName[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0))
        view.backgroundColor = .green
        let titleLabel = UILabel(frame: view.frame)
        titleLabel.textColor = .white
        if let title = expertise[section]["title"] as? String{
            titleLabel.text = title
        }
        view.addSubview(titleLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

/*
extension BepBarViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return expertise.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let codeName = expertise[section]["value"] as? [String] else {
            return 0
        }
        return codeName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BepBarTableViewCell") as! BepBarTableViewCell
        guard let codeName = expertise[indexPath.section]["value"] as? [String] else {
            return cell
        }
        cell.setTenBan(_tenBan: codeName[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0))
        view.backgroundColor = .green
        let titleLabel = UILabel(frame: view.frame)
        titleLabel.textColor = .white
        if let title = expertise[section]["title"] as? String{
            titleLabel.text = title
        }
        view.addSubview(titleLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension BepBarViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
 */
