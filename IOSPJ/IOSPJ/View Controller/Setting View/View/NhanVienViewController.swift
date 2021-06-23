//
//  NhanVienViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/23/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class NhanVienViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listNhanVien = [NhanVien]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nib = UINib(nibName: "NhanVienTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NhanVienTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listNhanVien.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NhanVienTableViewCell", for: indexPath) as! NhanVienTableViewCell
        
        return cell
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
