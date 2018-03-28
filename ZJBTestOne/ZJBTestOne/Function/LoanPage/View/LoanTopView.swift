//
//  LoanTopView.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2018/3/27.
//  Copyright © 2018年 zjb. All rights reserved.
//

import UIKit

class LoanTopView: UIView {

    //MARK: ☸property
    var animationView = UIView.init()
    var topImageView = UIImageView.init()
    var titleLabel = UILabel.init()
    
    var slider = UISlider.init()
    var scaline = UIView.init()
    
    //MARK: ♻️life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        xn_initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 🔒private
    private func xn_initSubViews() {
        self.addSubview(self.animationView)
        self.animationView.addSubview(self.topImageView)
        self.animationView.addSubview(self.titleLabel)
        
        self.animationView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    //MARK: 🎬event response
    
}
