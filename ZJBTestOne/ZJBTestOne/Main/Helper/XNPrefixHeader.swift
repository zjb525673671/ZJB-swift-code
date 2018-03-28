//
//  XNPrefixHeader.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2018/3/28.
//  Copyright © 2018年 zjb. All rights reserved.
//

import UIKit

let MainScreenHeight = UIScreen.main.bounds.size.height
let MainScreenWidth = UIScreen.main.bounds.size.width
let ScaleX = MainScreenWidth/375.0

/// 统一设置乘以屏幕比率
///
/// - Parameter h: iPhone 6上的尺寸
/// - Returns: 设配后的尺寸
func MByte(h:CGFloat) -> CGFloat
{
    return h*ScaleX
}

/// 状态栏高度
///
/// - Returns: 高度
func APStatusHeight() -> CGFloat
{
    if MainScreenHeight == 812.0 {
        return 44.0
    }
    return 20.0
}

/// 底部tabbar高度
///
/// - Returns: 高度
func APTabbarHeight() -> CGFloat
{
    if MainScreenHeight == 812.0 {
        return 83.0
    }
    return 49.0
}


/// 导航栏高度
///
/// - Returns: 高度
func APNavgationHeight() -> CGFloat
{
    if MainScreenHeight == 812.0 {
        return 88.0
    }
    return 64.0
}
