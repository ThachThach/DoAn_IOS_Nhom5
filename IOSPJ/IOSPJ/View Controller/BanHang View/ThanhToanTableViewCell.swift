//
//  ThanhToanTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/21/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ThanhToanTableViewCell: UITableViewCell {

    @IBOutlet weak var tenSanPhamLabel: UILabel!
    @IBOutlet weak var giaLabel: UILabel!
    @IBOutlet weak var soLuongLabel: UILabel!
    @IBOutlet weak var tongLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
