//
//  XNGradientView.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/18.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class XNGradientView: UIView {

    lazy public var starColor = UIColor()
    lazy public var endColor = UIColor()
    lazy public var startPoint = CGPoint()
    lazy public var endPoint = CGPoint()
    lazy private var backLayer: CAGradientLayer = {
       return CAGradientLayer()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backLayer.frame = self.bounds
        self.backLayer.startPoint = self.startPoint
        self.backLayer.endPoint = self.endPoint
        self.backLayer.colors = [(self.starColor.cgColor),(self.endColor.cgColor)]
        self.backLayer.locations = [0.0,1.0]
    }
    
    private func xn_initSubViews() {
       self.layer.addSublayer(self.backLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
