//
//  BanHangTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/9/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class BanHangTableViewCell: UITableViewCell {

    @IBOutlet weak var trangThaiLabel: UILabel!
    @IBOutlet weak var tenBanLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
