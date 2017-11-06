//
//  QuotaMainTaskCell.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/11/1.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class QuotaMainTaskCell: UITableViewCell {

    //MARK: ☸property
    
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
        self.selectionStyle = .none
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: 🎬event response

}
