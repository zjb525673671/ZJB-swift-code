//
//  BaseCategory.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/17.
//  Copyright © 2017年 zjb. All rights reserved.
//

import Foundation
import UIKit

//MARK: UILabel的类别
extension UILabel {
    
    
    //转换AnyHashable成string类型展示
    public func yzts_textToString(text:AnyHashable?) {
        if text == nil {
            self.text = nil
        } else {
            self.text = String(describing: text!)
        }
    }
    
    //label部分属性设置
    public func yzts_init(text:AnyHashable?, textAlignment:NSTextAlignment?) {
        self.yzts_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, fontSize: nil, textColor: nil, backgroundColor: nil)
    }
    
    public func yzts_init(text:AnyHashable?, textAlignment:NSTextAlignment?, fontSize:Float?) {
        self.yzts_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, fontSize: fontSize, textColor: nil, backgroundColor: nil)
    }
    
    public func yzts_init(text:AnyHashable?, textAlignment:NSTextAlignment?, fontSize:Float?, textColor:UIColor?) {
        self.yzts_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, fontSize: fontSize, textColor: textColor, backgroundColor: nil)
    }
    
    public func yzts_init(text:AnyHashable?, textAlignment:NSTextAlignment?, fontSize:Float?,
                          textColor:UIColor?, backgroundColor:UIColor?) {
        self.yzts_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, fontSize: fontSize, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    //设置label的所有属性
    public func yzts_initAllProperty(frame:CGRect?, text:AnyHashable?, textAlignment:NSTextAlignment?, fontSize:Float?,
                                     textColor:UIColor?, backgroundColor:UIColor?) {
        if frame != nil {
            self.frame = frame!
        }
        if text != nil {
            self.yzts_textToString(text: text)
        }
        if textAlignment != nil {
            self.textAlignment = textAlignment!
        }
        if fontSize != nil {
            self.font = UIFont.systemFont(ofSize: CGFloat(fontSize!))
        }
        if textColor != nil {
            self.textColor = textColor!
        }
        if backgroundColor != nil {
            self.backgroundColor = backgroundColor
        }
    }
}

//MARK: UIColor的类别
extension UIColor {
    fileprivate convenience init?(hex6: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                  blue: CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0, alpha: CGFloat(alpha))
    }
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    public convenience init?(hex: Int, alpha: CGFloat = 1.0) {
        if (0x000000 ... 0xFFFFFF) ~= hex {
            self.init(hex6: hex , alpha: alpha)
        } else {
            return nil
        }
    }
    
    public static func RGBA(hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)!
    }
    
    public static func yzts_arc4randomColor(_ randomAlpha: Bool = false) -> UIColor {
        return UIColor(r: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), g: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), b: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), a: (randomAlpha ? (CGFloat(Float(arc4random()) / Float(UINT32_MAX))) : 1.0))
    }
    
}
