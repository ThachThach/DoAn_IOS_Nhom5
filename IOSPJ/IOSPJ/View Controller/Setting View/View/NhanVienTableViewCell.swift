//
//  NhanVienTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/23/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class NhanVienTableViewCell: UITableViewCell {

    @IBOutlet weak var tenNhanVienLabel: UILabel!
    @IBOutlet weak var iconNhanVien: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
