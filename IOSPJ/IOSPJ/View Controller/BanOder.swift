//
//  BanOder.swift
//  IOSPJ
//
//  Created by CNTT on 6/13/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import Foundation

class BanOder {
    var tenBan : String
    var trangThai : String
    
    init?(tenBan:String, trangThai:String){
        if tenBan.isEmpty{
            return nil
        }
        self.tenBan = tenBan
        self.trangThai = trangThai
    }
}
