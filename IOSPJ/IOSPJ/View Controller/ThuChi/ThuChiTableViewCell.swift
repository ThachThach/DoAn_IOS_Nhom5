//
//  ThuChiTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/13/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ThuChiTableViewCell: UITableViewCell {

    @IBOutlet weak var thangLabel: UILabel!
    @IBOutlet weak var tongThuLabel: UILabel!
    @IBOutlet weak var tongVonLabel: UILabel!
    @IBOutlet weak var tongLoiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
