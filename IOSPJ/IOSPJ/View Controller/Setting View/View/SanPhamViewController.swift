//
//  SanPhamViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/10/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class SanPhamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let data = ["sp1","sp2", "sp3", "sp4", "sp5", "sp6", "sp7"]

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SanPhamTableViewCell", bundle: nil)
//        
        tableView.register(nib, forCellReuseIdentifier: "SanPhamTableViewCell")
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SanPhamTableViewCell", for: indexPath) as! SanPhamTableViewCell
        
        cell.tenSanPhamLabel?.text = data[indexPath.row]
        
        return cell
    }
    

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
