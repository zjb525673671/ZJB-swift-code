//
//  XNNetWorkManager.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/22.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit
import Alamofire

class XNNetWorkManager: NSObject {
    
    func xn_request() {
        Alamofire.request("", method: .post, parameters: nil).responseJSON { (result) in
            
        }
    }
    

}
