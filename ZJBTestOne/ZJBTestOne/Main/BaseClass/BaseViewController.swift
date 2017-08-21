//
//  BaseViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: ☸property
    var topView:UIView = {
        return UIView.init()
    } ()
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.base_initSubViews()
        self.base_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func base_initData() {
        
    }
    
    private func base_initSubViews() {
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response
    
}
