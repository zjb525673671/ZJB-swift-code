//
//  XNProgressHUD.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/9/7.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

let XNProgressHUD = ProgressHUD.sharedInstance

private let ProgressHUDShareInstance = ProgressHUD()

class ProgressHUD {
    fileprivate var isLoading = false
    fileprivate var tipsView = UIView.init()
    fileprivate var loadView = XNLoadingView.init(frame: UIScreen.main.bounds)
    class var sharedInstance : ProgressHUD {
        return ProgressHUDShareInstance
    }
}

class XNLoadingView: UIView {
    private var loadImageView = UIImageView.init(image: UIImage.init(named: "loading_01"))
    private var imageArray = NSArray.init(objects: UIImage.init(named: "loading_01")!,
                                          UIImage.init(named: "loading_02")!,
                                          UIImage.init(named: "loading_03")!,
                                          UIImage.init(named: "loading_04")!,
                                          UIImage.init(named: "loading_05")!,
                                          UIImage.init(named: "loading_06")!,
                                          UIImage.init(named: "loading_07")!,
                                          UIImage.init(named: "loading_08")!,
                                          UIImage.init(named: "loading_09")!,
                                          UIImage.init(named: "loading_10")!,
                                          UIImage.init(named: "loading_11")!,
                                          UIImage.init(named: "loading_12")!)
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        self.backgroundColor = UIColor.RGBA(hex: 0x000000, alpha: 0.5)
        self.addSubview(self.loadImageView)
        self.loadImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSize.init(width: 120*ScaleX, height: 120*ScaleX))
        }
        self.loadImageView.animationImages = self.imageArray as? [UIImage]
        self.loadImageView.animationDuration = 1.2
        self.loadImageView.animationRepeatCount = 0;
    }
    
    public func startAnimation() {
        self.loadImageView.startAnimating()
    }
    
    public func stopAnimation() {
        self.loadImageView.stopAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProgressHUD {
    
    public func showError(error : String) {
        
    }
    public func showLoading() {
        UIApplication.shared.keyWindow?.addSubview(self.loadView)
        self.loadView.startAnimation()
    }
    public func dismissLoading() {
        self.loadView.stopAnimation()
        self.loadView.removeFromSuperview()
    }
}
