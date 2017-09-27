//
//  BaseNavigtionController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/21.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class BaseNavigtionController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dropShadow(offset: CGSize.init(width: 0, height: 1.5), radius: 9, color: UIColor.RGBA(hex: 0xdb1e55), opacity: 0.5)
        self.navigationBar.backgroundColor = UIColor.clear
        self.navigationBar.barTintColor = UIColor.clear
        var newImage = UIImage.init(named: "public_navigition_back")
        newImage = newImage?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, (newImage?.size.width)!/2 - 5, (newImage?.size.height)!/2 - 5, (newImage?.size.width)!/2 - 10))
        self.navigationBar.setBackgroundImage(newImage, for: UIBarMetrics.default)
        
    }

    private func dropShadow (offset:CGSize, radius:CGFloat, color:UIColor, opacity:CGFloat) {
        let path: CGMutablePath = CGMutablePath()
        path.addRect(self.navigationBar.bounds, transform: .identity)
        self.navigationBar.layer.shadowPath = path
        path.closeSubpath()
        self.navigationBar.layer.shadowColor = color.cgColor
        self.navigationBar.layer.shadowOffset = offset
        self.navigationBar.layer.shadowRadius = radius
        self.navigationBar.layer.shadowOpacity = Float(opacity)
        self.navigationBar.clipsToBounds = false
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }


}
