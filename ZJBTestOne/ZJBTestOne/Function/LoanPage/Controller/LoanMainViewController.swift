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
    private var scrollView = UIScrollView.init()
    public var pages = NSInteger.init()
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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            if !XNUserInfo.isLogin {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoginRegisterShowNotifacation), object: nil)
            }
        }
        
    }
    
    private func xn_initSubViews() {
        
        self.scrollView.frame = self.view.bounds
        self.view.addSubview(self.scrollView)
        
    }
    
    @objc private func clickAction_enterNext() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoginRegisterShowNotifacation), object: nil)
        
    }
    
    public func clickAction_update() {
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
