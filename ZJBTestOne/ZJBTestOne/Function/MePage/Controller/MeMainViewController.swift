//
//  MeMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class MeMainViewController: BaseViewController {

    //MARK: ☸property
    var topView = UIView.init()
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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        
    }
    
    private func xn_initSubViews() {
        let backLayer = CAGradientLayer.init()
        backLayer.frame = self.view.bounds
        backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        backLayer.colors = [(UIColor.RGBA(hex: 0xf63875).cgColor),(UIColor.RGBA(hex: 0xf9603c).cgColor)]
        backLayer.locations = [0.0,1.0]
        self.view.layer.addSublayer(backLayer)
        self.view.addSubview(self.topView)
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
