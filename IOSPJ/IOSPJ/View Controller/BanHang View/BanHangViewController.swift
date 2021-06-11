//
//  BanHangViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/3/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class BanHangViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myData = ["first", "first1", "first2", "first3", "first4", "first5"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "BanHangTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "BanHangTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BanHangTableViewCell", for: indexPath) as! BanHangTableViewCell
        cell.tenBanLabel?.text = myData[indexPath.row]
        cell.trangThaiLabel?.text = myData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let oderView = sb.instantiateViewController(withIdentifier: "oder") as! OderViewController
        self.navigationController?.pushViewController(oderView, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
