//
//  NhomSanPhamViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/3/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseFirestore

class NhomSanPhamViewController: UIViewController , UITableViewDataSource {


    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let db = Firestore.firestore()
        myTableView.dataSource = self
        
        db.collection("test").document().setData([
            "name": "Peacock",
            "type": "Herbivore",
            "colors": ["Green", "White", "Blue", "Black"]
            ])
        db.collection("test").document().setData([
            "name": "Bat",
            "type": "Herbivore",
            "norturnal": true,
            "colors": ["Brown", "Black"]
            ], merge: true)
        // Do any additional setup after loading the view.
        print("test")
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "hello"
        return cell!
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
