//
//  SanPham.swift
//  IOSPJ
//
//  Created by CNTT on 6/13/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import Foundation
import Firebase

class SanPham {
    var tenSanPham : String
    var giaVon : String
    var giaBan : String
    
    init?(tenSanPham:String, giaVon:String, giaBan:String){
        if tenSanPham.isEmpty{
            return nil
        }
        self.tenSanPham = tenSanPham
        self.giaBan = giaBan
        self.giaVon = giaVon
    }
}
