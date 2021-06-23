//
//  Oder.swift
//  IOSPJ
//
//  Created by CNTT on 6/20/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import Foundation

class Oder{
    var tenSanPham : String
    var soLuong : String
    
    init?(tenSanPham:String, soLuong:String){
        if tenSanPham.isEmpty{
            return nil
        }
        self.tenSanPham = tenSanPham
        self.soLuong = soLuong
    }
}
