//
//  LoanMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit
import SnapKit

class LoanMainViewController: BaseViewController {

    //MARK: ☸property
    var enterButton = XNGradientButton.init(type: UIButtonType.custom)
    var testImageView = UIImageView()
    
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        self.enterButton.frame = CGRect(x:100,y:100,width:100,height:200)
//        self.enterButton.snp.makeConstraints { (make) in
//            make.top.equalTo(self.view).offset(64)
//            make.centerX.equalTo(self.view)
//            make.size.equalTo(CGSize(width: 200, height: 200))
//        }
        self.enterButton.backgroundColor = UIColor.green
        self.enterButton.addTarget(self, action: #selector(self.clickAction_enterNext), for: .touchUpInside)
    }
    
    @objc private func clickAction_enterNext() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoginRegisterShowNotifacation), object: nil)
//        let authenVC = AuthenMainViewController()
//        self.navigationController?.pushViewController(authenVC, animated: true)
    }
    
    public func clickAction_update() {
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
