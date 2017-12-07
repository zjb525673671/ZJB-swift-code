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
    public func xn_textToString(text:AnyHashable?) {
        if text == nil {
            self.text = nil
        } else {
            self.text = String(describing: text!)
        }
    }
    
    //label部分属性设置
    public func xn_init(text:AnyHashable?, textAlignment:NSTextAlignment?) {
        self.xn_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, font: nil, textColor: nil, backgroundColor: nil)
    }
    
    public func xn_init(text:AnyHashable?, textAlignment:NSTextAlignment?, font:UIFont?) {
        self.xn_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, font: font, textColor: nil, backgroundColor: nil)
    }
    
    public func xn_init(text:AnyHashable?, textAlignment:NSTextAlignment?, font:UIFont?, textColor:UIColor?) {
        self.xn_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, font: font, textColor: textColor, backgroundColor: nil)
    }
    
    public func xn_init(text:AnyHashable?, textAlignment:NSTextAlignment?, font:UIFont?,
                          textColor:UIColor?, backgroundColor:UIColor?) {
        self.xn_initAllProperty(frame: nil, text: text, textAlignment: textAlignment, font: font, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    //设置label的所有属性
    public func xn_initAllProperty(frame:CGRect?, text:AnyHashable?, textAlignment:NSTextAlignment?, font:UIFont?,
                                     textColor:UIColor?, backgroundColor:UIColor?) {
        if frame != nil {
            self.frame = frame!
        }
        if text != nil {
            self.xn_textToString(text: text)
        }
        if textAlignment != nil {
            self.textAlignment = textAlignment!
        }
        if font != nil {
            self.font = font
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
    
    public static func layerStartColor() -> UIColor {
        return UIColor(hex: 0x235678, alpha: 1.0)!
    }
    public static func layerEndColor() -> UIColor {
        return UIColor(hex: 0x782345, alpha: 1.0)!
    }
    
    public static func yzts_arc4randomColor(_ randomAlpha: Bool = false) -> UIColor {
        return UIColor(r: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), g: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), b: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), a: (randomAlpha ? (CGFloat(Float(arc4random()) / Float(UINT32_MAX))) : 1.0))
    }
    
}

extension UIFont {
    public static func lightFont(size:CGFloat) -> UIFont {
        var font = UIFont(name: "PingFangSC-Light", size: size)
        if font == nil {
            font = UIFont.systemFont(ofSize: size)
        }
        return font!
    }
    public static func regularFont(size:CGFloat) -> UIFont {
        var font = UIFont(name: "PingFangSC-Regular", size: size)
        if font == nil {
            font = UIFont.systemFont(ofSize: size)
        }
        return font!
    }
    public static func mediumFont(size:CGFloat) -> UIFont {
        var font = UIFont(name: "PingFangSC-Medium", size: size)
        if font == nil {
            font = UIFont.systemFont(ofSize: size)
        }
        return font!
    }
}

extension UIImage {
    
    /// 把一个View变成一张图片
    ///
    /// - Parameter baseView: 需要变成图片的View
    /// - Returns: 生成后的图片
    public static func xn_createImage(baseView:UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(baseView.bounds.size, false, UIScreen.main.scale)
        baseView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

