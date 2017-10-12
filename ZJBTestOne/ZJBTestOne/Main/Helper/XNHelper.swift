//
//  XNHelper.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/21.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let ScaleX = kScreenWidth/375.0

class XNHelper: NSObject {

    public static func help_topistance() -> Float {
        if kScreenHeight == 812.0
        {
            return 20.0
        }
        else
        {
            return 0.0
        }
    }
}
