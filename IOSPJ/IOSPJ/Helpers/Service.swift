//
//  Service.swift
//  PJ_IOS
//
//  Created by CNTT on 6/1/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//
import UIKit

import Foundation
class Service {
    static func createLertController(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "ok", style: .default) { (action) in
            
        }
        alert.addAction(okAction)
        return alert
    }
}
