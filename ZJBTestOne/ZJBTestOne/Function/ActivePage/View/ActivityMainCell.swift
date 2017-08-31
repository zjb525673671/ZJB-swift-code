//
//  ActivityMainCell.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/30.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class ActivityMainCell: UITableViewCell {

    //MARK: ☸property
    private var backView = UIView.init()
    private var itemImageView = UIImageView.init()
    private var peopleLabel = UILabel.init()
    private var jionLabel = UILabel.init()
    //MARK: ♻️life cycle
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
    
    //MARK: 🔒private
    private func xn_initSubViews() {
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.itemImageView)
        self.backView.addSubview(self.peopleLabel)
        self.backView.addSubview(self.jionLabel)
        
        self.backView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12*ScaleX)
            make.right.equalTo(self.contentView).offset(-12*ScaleX)
            make.top.equalTo(self.contentView).offset(6*ScaleX)
            make.bottom.equalTo(self.contentView).offset(-6*ScaleX)
        }
        self.itemImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.backView)
            make.bottom.equalTo(self.backView).offset(-26*ScaleX)
        }
        self.jionLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.backView).offset(-12*ScaleX)
            make.bottom.equalTo(self.backView)
            make.size.equalTo(CGSize.init(width: 60*ScaleX, height: 26*ScaleX))
        }
        self.peopleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.backView).offset(12*ScaleX)
            make.bottom.equalTo(self.backView)
            make.right.equalTo(self.jionLabel.snp.left)
            make.height.equalTo(26*ScaleX)
        }
        self.backView.layer.cornerRadius = 4
        self.backView.clipsToBounds = true
        self.backView.backgroundColor = UIColor.white
        self.itemImageView.image = UIImage.init(named: "")
        self.peopleLabel.xn_init(text: "239人已参与", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 12*ScaleX), textColor: UIColor.RGBA(hex: 0x7c7a7a))
        self.jionLabel.xn_init(text: "您尚未参与", textAlignment: NSTextAlignment.right, font: UIFont.regularFont(size: 12*ScaleX), textColor: UIColor.RGBA(hex: 0x7c7a7a))
        
    }
    //MARK: 🚪public
    
    public func updateCellData(model:ActivityMainModel) {
        self.itemImageView.image = UIImage.init(contentsOfFile: model.imageUrl)
        self.peopleLabel.text = "\(model.peopleCount)人已参与"
        if model.isJion {
            self.jionLabel.text = "您已经参与"
        } else {
            self.jionLabel.text = "您尚未参与"
        }
    }
    //MARK: 🍐delegate
    //MARK: 🎬event response

}
