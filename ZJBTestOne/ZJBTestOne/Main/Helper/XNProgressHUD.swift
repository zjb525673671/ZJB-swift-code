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
    fileprivate var tipsView = XNTipsView.init(frame: UIScreen.main.bounds)
    fileprivate var loadView = XNLoadingView.init(frame: UIScreen.main.bounds)
    class var sharedInstance : ProgressHUD {
        return ProgressHUDShareInstance
    }
}

class XNTipsView: UIView {
    
    var infoLabel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    private func xn_initSubViews() {
        self.addSubview(self.infoLabel)
        self.infoLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(100*ScaleX)
            make.height.equalTo(30*ScaleX)
        }
        self.infoLabel.xn_init(text: "", textAlignment: NSTextAlignment.center, font: UIFont.regularFont(size: 16*ScaleX), textColor: UIColor.white)
        self.infoLabel.backgroundColor = UIColor.RGBA(hex: 0x000000, alpha: 0.8);
        self.infoLabel.layer.cornerRadius = 4*ScaleX
        self.infoLabel.clipsToBounds = true;
    }
    
    public func showInfo(message:String) {
        let width = message.size(attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16*ScaleX)]).width
        self.infoLabel.snp.updateConstraints { (make) in
            make.width.equalTo(width + 10*ScaleX)
        }
        self.infoLabel.text = message;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

//loading框主要的类
extension ProgressHUD {
    
    public func showError(error : String) {
        if !error.isEmpty
        {
            self.tipsView.showInfo(message: error)
            UIApplication.shared.keyWindow?.addSubview(self.tipsView)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                self.tipsView.removeFromSuperview()
            })
        }
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
