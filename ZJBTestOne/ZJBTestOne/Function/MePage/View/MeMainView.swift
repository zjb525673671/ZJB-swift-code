//
//  MeMainView.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/21.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class MeMainTopView: UIView {
    
    var headView = UIView.init()
    var phoneNumLabel = UILabel.init()
    var authenImageView = UIImageView.init()
    var bankImageView = UIImageView.init()
    var recordImageView = UIImageView.init()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        self.layer.cornerRadius = 4
        self.backgroundColor = UIColor.white
        self.addSubview(self.headView)
        self.addSubview(self.phoneNumLabel)
        self.addSubview(self.authenImageView)
        self.addSubview(self.bankImageView)
        self.addSubview(self.recordImageView)
        self.headView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.snp.top)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 200*ScaleX))
        }
        self.phoneNumLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.headView.snp.bottom).offset(12*ScaleX)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 200*ScaleX))
        }
        self.authenImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(33)
            make.centerY.equalTo(self.snp.top)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 200))
        }
        self.bankImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.snp.top)
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        self.recordImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.snp.top)
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        self.headView.layer.cornerRadius = 100*ScaleX
        self.headView.layer.borderWidth = 3
        self.headView.layer.borderColor = UIColor.RGBA(hex: 0xffffff).cgColor
        self.headView.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class MeMainMiddleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MeMainBottomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
