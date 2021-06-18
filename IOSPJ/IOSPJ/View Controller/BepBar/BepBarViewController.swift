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
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
    }
    
    @IBAction func refreshTableview(_ sender: Any) {
        loadData()
        tableView.reloadData()
    }
    
    func loadData() {
        let allPlaces = ref.child("oder2")
        
        allPlaces.observeSingleEvent(of: .value, with: { snapshot in
            self.expertise.removeAll()
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                //print("test : \(snap.key)")
                
                var key_value = [String]()
                for i in placeDict {
                    let k = i.key
                    let v = i.value
                    key_value.append("\(k)  SL: \(v)")
                }
                self.expertise.append(["title" : "\(snap.key)", "value": key_value])
            }
            self.view.backgroundColor = .clear
            self.tableView.tableFooterView = UIView(frame: .zero)
            self.tableView.register(UINib(nibName: "BepBarTableViewCell", bundle: nil), forCellReuseIdentifier: "BepBarTableViewCell")
            self.tableView.delegate = self
            self.tableView.dataSource = self
        })
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
        let numberRow = indexPath[0] as Int
        let title = expertise[numberRow]["title"] as? String ?? ""
        ref.child("oder2").child(title).removeValue()
        
        expertise.remove(at: numberRow)
        
        tableView.reloadData()
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
        view.backgroundColor = .darkGray
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
