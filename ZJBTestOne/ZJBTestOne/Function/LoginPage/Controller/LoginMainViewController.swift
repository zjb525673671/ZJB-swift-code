//
//  LoginMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/26.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoginMainViewController: BaseViewController {

    //MARK: ☸property
    
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func xn_initSubViews() {
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
