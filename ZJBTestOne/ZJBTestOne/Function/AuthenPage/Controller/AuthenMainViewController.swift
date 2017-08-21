//
//  AuthenMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/21.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class AuthenMainViewController: BaseViewController {

    //MARK: ☸property
    
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
        self.title = "认证中心"
    }
    
    private func xn_initSubViews() {
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
