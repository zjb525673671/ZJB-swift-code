//
//  MeMainCell.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/21.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class MeMainHeadCell: UITableViewCell {

    var headImageView = UIImageView.init()
    var phoneNumLabel = UILabel.init()
    var authenImageView = UIImageView.init()
    var bankImageView = UIImageView.init()
    var recordImageView = UIImageView.init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        self.contentView.addSubview(self.headImageView)
        self.contentView.addSubview(self.phoneNumLabel)
        self.contentView.addSubview(self.authenImageView)
        self.contentView.addSubview(self.bankImageView)
        self.contentView.addSubview(self.recordImageView)
        
        self.headImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.snp.top)
            make.size.equalTo(CGSize.init(width: 70*ScaleX, height: 70*ScaleX))
        }
        
        self.headImageView.layer.cornerRadius = 35*ScaleX
        self.headImageView.layer.borderWidth = 3
        self.headImageView.layer.borderColor = UIColor.white.cgColor
    }

}

class MeMainNormalCell: UITableViewCell {
    
    var leftImageView = UIImageView.init()
    var itemLabel = UILabel.init()
    var selectImageView = UIImageView.init()
    var bottomLine = UIView.init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        self.contentView.addSubview(self.leftImageView)
        self.contentView.addSubview(self.itemLabel)
        self.contentView.addSubview(self.selectImageView)
        self.contentView.addSubview(self.bottomLine)
        
        self.leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(22*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 21*ScaleX, height: 21*ScaleX))
        }
        self.itemLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(22*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 21*ScaleX, height: 21*ScaleX))
        }
        self.selectImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(22*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 21*ScaleX, height: 21*ScaleX))
        }
        self.bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(22*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 21*ScaleX, height: 21*ScaleX))
        }
    }
}
