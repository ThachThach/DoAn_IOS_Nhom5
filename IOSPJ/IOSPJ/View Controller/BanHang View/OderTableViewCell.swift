//
//  OderTableViewCell.swift
//  IOSPJ
//
//  Created by CNTT on 6/9/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class OderTableViewCell: UITableViewCell {

    @IBOutlet weak var soLuongLabel: UILabel!
    @IBOutlet weak var tenMonLabel: UILabel!
    @IBOutlet weak var soLuongSrepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        soLuongLabel.text = Int(sender.value).description
    }
}
