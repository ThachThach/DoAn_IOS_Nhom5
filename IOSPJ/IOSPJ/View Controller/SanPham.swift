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
    var id: String
    var tenSanPham : String
    var soLuongOder : String
    var giaVon : String
    var giaBan : String
    
    init?(id:String, tenSanPham:String, soLuongOder:String, giaVon:String, giaBan:String){
        if tenSanPham.isEmpty{
            return nil
        }
        self.id = id
        self.tenSanPham = tenSanPham
        self.soLuongOder = soLuongOder
        self.giaBan = giaBan
        self.giaVon = giaVon
    }
}
