//
//  NhanVien.swift
//  IOSPJ
//
//  Created by CNTT on 6/23/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import Foundation

class NhanVien{
    var id : String
    var tenNhanVien : String
    var chucVu : String
    var email : String
    var calam : String
    
    init?(id:String, tenNhanVien:String, chucVu:String, email:String, calam:String){
        if tenNhanVien.isEmpty{
            return nil
        }
        self.id = id
        self.tenNhanVien = tenNhanVien
        self.chucVu = chucVu
        self.email = email
        self.calam = calam
    }
}
