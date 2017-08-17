//
//  LoanMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoanMainViewController: BaseViewController {

    //MARK: ☸property
    var enterButton = UIButton.init(type: UIButtonType.custom)
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
        self.title = "贷款"
    }
    
    private func xn_initSubViews() {
        
        self.view.addSubview(self.enterButton)
        self.enterButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(64)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        self.enterButton.backgroundColor = UIColor.red
        self.enterButton.addTarget(self, action: #selector(self.clickAction_enterNext), for: .touchUpInside)
    }
    
    @objc private func clickAction_enterNext() {
        
    }
    
    public func clickAction_update() {
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
