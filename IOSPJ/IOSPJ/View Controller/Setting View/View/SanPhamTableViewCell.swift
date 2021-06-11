//
//  SanPhamTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/10/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class SanPhamTableViewCell: UITableViewCell {

    @IBOutlet weak var tenSanPhamLabel: UILabel!
    @IBOutlet weak var giaVonLabel: UILabel!
    @IBOutlet weak var giaLeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
