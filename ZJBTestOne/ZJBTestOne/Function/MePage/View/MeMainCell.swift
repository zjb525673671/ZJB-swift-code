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
    var authenButton = UIButton.init(type: UIButtonType.custom)
    var authenLabel = UILabel.init()
    var bankButton = UIButton.init(type: UIButtonType.custom)
    var bankLabel = UILabel.init()
    var recordButton = UIButton.init(type: UIButtonType.custom)
    var recordLabel = UILabel.init()
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
        self.contentView.addSubview(self.authenButton)
        self.contentView.addSubview(self.bankButton)
        self.contentView.addSubview(self.recordButton)
        self.contentView.addSubview(self.authenLabel)
        self.contentView.addSubview(self.bankLabel)
        self.contentView.addSubview(self.recordLabel)
        
        self.backView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(178*ScaleX)
        }
        self.headImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.backView)
            make.centerY.equalTo(self.backView.snp.top)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 80*ScaleX))
        }
        self.phoneNumLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.headImageView.snp.bottom)
            make.centerX.equalTo(self.backView)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 20*ScaleX))
        }
        self.authenButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView).offset(91*ScaleX)
            make.left.equalTo(self.backView).offset(33*ScaleX)
            make.size.equalTo(CGSize.init(width: 48*ScaleX, height: 40*ScaleX))
        }
        self.bankButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView).offset(91*ScaleX)
            make.centerX.equalTo(self.backView)
            make.size.equalTo(CGSize.init(width: 48*ScaleX, height: 40*ScaleX))
        }
        self.recordButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView).offset(91*ScaleX)
            make.right.equalTo(self.backView).offset(-33*ScaleX)
            make.size.equalTo(CGSize.init(width: 48*ScaleX, height: 40*ScaleX))
        }
        self.authenLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.authenButton.snp.bottom).offset(3)
            make.centerX.equalTo(self.authenButton)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 17*ScaleX))
        }
        self.bankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.bankButton.snp.bottom).offset(3)
            make.centerX.equalTo(self.bankButton)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 17*ScaleX))
        }
        self.recordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.recordButton.snp.bottom).offset(3)
            make.centerX.equalTo(self.recordButton)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 17*ScaleX))
        }
        
        self.headImageView.layer.cornerRadius = 40*ScaleX
        self.headImageView.layer.borderWidth = 4
        self.headImageView.clipsToBounds = true
        self.headImageView.layer.borderColor = UIColor.white.cgColor
        self.headImageView.image = UIImage.init(named: "me_head_icon")
        self.backView.backgroundColor = UIColor.white
        self.backView.layer.cornerRadius = 4
        self.authenButton.setImage(UIImage.init(named: "me_cell_authen"), for: UIControlState.normal)
        self.bankButton.setBackgroundImage(UIImage.init(named: "me_cell_bank"), for: UIControlState.normal)
        self.recordButton.setImage(UIImage.init(named: "me_cell_record"), for: UIControlState.normal)
        self.phoneNumLabel.xn_init(text: "137****8195", textAlignment: NSTextAlignment.center, font: UIFont.regularFont(size: 14*ScaleX), textColor: UIColor.RGBA(hex: 0x242121))
        self.authenLabel.xn_init(text: "完善资料", textAlignment: NSTextAlignment.center, font: UIFont.regularFont(size: 12*ScaleX), textColor: UIColor.RGBA(hex: 0x242121))
        self.bankLabel.xn_init(text: "绑定银行卡", textAlignment: NSTextAlignment.center, font: UIFont.regularFont(size: 12*ScaleX), textColor: UIColor.RGBA(hex: 0x242121))
        self.recordLabel.xn_init(text: "借款记录", textAlignment: NSTextAlignment.center, font: UIFont.regularFont(size: 12*ScaleX), textColor: UIColor.RGBA(hex: 0x242121))
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
        self.selectImageView.image = UIImage.init(named: "me_cell_arrow")
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

class MeSettingCell: UITableViewCell {
    
    var itemLabel = UILabel.init()
    var selectImageView = UIImageView.init()
    var bottomLine = UIView.init()
    
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
        self.contentView.addSubview(self.itemLabel)
        self.contentView.addSubview(self.selectImageView)
        self.contentView.addSubview(self.bottomLine)

        self.selectImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: 14*ScaleX, height: 14*ScaleX))
        }
        self.itemLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.selectImageView.snp.left)
            make.height.equalTo(24*ScaleX)
        }
        self.bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
        }
        self.backgroundColor = UIColor.clear
        self.selectImageView.image = UIImage.init(named: "me_cell_arrow")
        self.bottomLine.backgroundColor = UIColor.RGBA(hex: 0xeeeeee)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.itemLabel.xn_init(text: "", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 16*ScaleX), textColor: UIColor.RGBA(hex: 0x242121))
    }
    public func cell_updateData(index:NSInteger) {
        
        if index == 0 {
            self.itemLabel.text = "关于我们"
        } else if index == 1 {
            self.itemLabel.text = "意见反馈"
        } else {
            self.itemLabel.text = "修改登录密码"
        }
    }
}
