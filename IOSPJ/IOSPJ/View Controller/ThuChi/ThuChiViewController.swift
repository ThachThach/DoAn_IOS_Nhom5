//
//  ThuChiViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/13/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ThuChiViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    let myData = ["first", "first1", "first2", "first3", "first4", "first5", "first", "first1", "first2", "first3", "first4", "first5"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ThuChiTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "ThuChiTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThuChiTableViewCell" ,for: indexPath) as! ThuChiTableViewCell
            cell.thangLabel?.text = "\(indexPath.row+1)"
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
