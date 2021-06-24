//
//  BepBarTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/10/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class BepBarTableViewCell: UITableViewCell {

    @IBOutlet weak var tenMonLabel: UILabel!
    @IBOutlet weak var soLuongLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setTenBan(_tenBan: String){
        self.tenMonLabel.text = _tenBan
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
