//
//  XNGradientButton.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/18.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class XNGradientButton: UIButton {

    lazy private var backImageView = UIImage()

    private var backView : XNGradientView = {
       let newView = XNGradientView()
        newView.starColor = UIColor.RGBA(hex: 0xf63875)
        newView.endColor = UIColor.RGBA(hex: 0xf9603c)
        newView.startPoint = CGPoint(x:0, y:0)
        newView.endPoint = CGPoint(x:0, y:1)
        return newView
    }()
    
//    var newEnable : Bool = false
//    
//    override var isEnabled: Bool {
//        
//        set{
//            newEnable = isEnabled
//            if isEnabled {
//                self.setBackgroundImage(self.backImageView, for: UIControlState.normal)
//            }
//            else
//            {
//                self.setBackgroundImage(nil, for: UIControlState.normal)
//            }
//        }
//        get{
//            return newEnable
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.backView.frame = self.bounds
//        DispatchQueue.global().async {
//            let image = UIImage.xn_createImage(baseView: self.backView)
//            DispatchQueue.main.async {
//                self.setBackgroundImage(image, for: UIControlState.normal)
//            }
//        }
    }
    
    private func xn_initSubViews() {
//        self.addSubview(self.backView)
//        self.backView.frame = CGRect(x:0,y:0,width:100,height:200)
        
    }
    
    public func xn_gradView() {
        self.backView.frame = self.bounds
        self.setBackgroundImage(UIImage.xn_createImage(baseView: self.backView), for: UIControlState.normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
