//
//  ThuChiViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/13/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import Firebase

class ThuChiViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var expertise = [Dictionary<String, Any>]()
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ThuChiTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "ThuChiTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        getdata()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThuChiTableViewCell" ,for: indexPath) as! ThuChiTableViewCell
            cell.thangLabel?.text = "\(indexPath.row+1)"
        
        return cell
    }
    
    func getdata(){
        let allPlaces = ref.child("thuchi")
        
        allPlaces.observeSingleEvent(of: .value, with: { snapshot in
            self.expertise.removeAll()
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                
                var key_value = [[String: Any]]()
                for i in placeDict {
                    let k = i.key
                    let v = i.value
                    key_value.append([k: v])
                }
                self.expertise.append(["thang\(snap.key)": key_value])
            }
            print("test \(self.expertise[0]["tongthu"])")
            //let abc = self.expertise[0]["value"] as! [Dictionary<String, Any>]
            
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

}
