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
    var backView = UIView.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.xn_initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.headImageView)
        self.contentView.addSubview(self.phoneNumLabel)
        self.contentView.addSubview(self.authenImageView)
        self.contentView.addSubview(self.bankImageView)
        self.contentView.addSubview(self.recordImageView)
        
        self.backView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(178*ScaleX)
        }
        self.headImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.backView)
            make.centerY.equalTo(self.backView.snp.top)
            make.size.equalTo(CGSize.init(width: 70*ScaleX, height: 70*ScaleX))
        }
        
        self.headImageView.layer.cornerRadius = 35*ScaleX
        self.headImageView.layer.borderWidth = 3
        self.headImageView.clipsToBounds = true
        self.headImageView.layer.borderColor = UIColor.white.cgColor
        self.headImageView.image = UIImage.init(named: "me_head_icon")
        self.backView.backgroundColor = UIColor.white
        self.backView.layer.cornerRadius = 4
        self.backgroundColor = UIColor.clear
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

}

class MeMainNormalCell: UITableViewCell {
    
    var leftImageView = UIImageView.init()
    var itemLabel = UILabel.init()
    var selectImageView = UIImageView.init()
    var bottomLine = UIView.init()
    var upView = UIView.init()
    var downView = UIView.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.xn_initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.xn_initSubViews()
    }
    
    private func xn_initSubViews() {
        self.contentView.addSubview(self.upView)
        self.contentView.addSubview(self.downView)
        self.contentView.addSubview(self.leftImageView)
        self.contentView.addSubview(self.itemLabel)
        self.contentView.addSubview(self.selectImageView)
        self.contentView.addSubview(self.bottomLine)
        
        self.upView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.top.equalTo(self.contentView)
            make.height.equalTo(30*ScaleX)
        }
        self.downView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(30*ScaleX)
        }
        self.leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(22*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 21*ScaleX, height: 21*ScaleX))
        }
        self.selectImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-22*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 14*ScaleX, height: 14*ScaleX))
        }
        self.itemLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.leftImageView.snp.right).offset(10*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.selectImageView.snp.left)
            make.height.equalTo(24*ScaleX)
        }
        self.bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(22*ScaleX)
            make.right.equalTo(self.contentView).offset(-22*ScaleX)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
        }
        self.backgroundColor = UIColor.clear
        self.upView.backgroundColor = UIColor.white
        self.downView.backgroundColor = UIColor.white
        self.bottomLine.backgroundColor = UIColor.RGBA(hex: 0xeeeeee)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.upView.layer.cornerRadius = 4
        self.downView.layer.cornerRadius = 4
        self.itemLabel.xn_init(text: nil, textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 14*ScaleX), textColor: UIColor.RGBA(hex: 0x242121))
    }
    
    public func cell_updateData(model:MeMainModel) {
        self.itemLabel.text = model.title
        self.leftImageView.image = UIImage.init(named: model.imageIcon)
        self.bottomLine.isHidden = model.isHidden
        if model.index == 1 {
            self.upView.layer.cornerRadius = 4
            self.downView.layer.cornerRadius = 0
        } else if model.index == 2 {
            self.upView.layer.cornerRadius = 0
            self.downView.layer.cornerRadius = 4
        } else {
            self.upView.layer.cornerRadius = 0
            self.downView.layer.cornerRadius = 0
        }
    }
}
