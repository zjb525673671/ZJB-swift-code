//
//  BaseTabBarController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    //MARK: ☸property
    
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildController(VC: LoanMainViewController(), imageName: "tabBar_loan_normal", selectImage: "", title: "贷款", tag: 1)
        self.addChildController(VC: QuotaMainViewController(), imageName: "tabBar_quota_normal", selectImage: "", title: "提额", tag: 2)
        self.addChildController(VC: ActivityMainViewController(), imageName: "tabBar_activety_normal", selectImage: "", title: "活动", tag: 3)
        self.addChildController(VC: MeMainViewController(), imageName: "tabBar_me_normal", selectImage: "", title: "我的", tag: 4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    //MARK: 🔒private
    
    private func addChildController(VC: UIViewController?, imageName: String?, selectImage: String?, title: String?, tag:NSInteger) {
        VC?.title = title
        VC?.tabBarItem.image = UIImage.init(named: imageName!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        VC?.tabBarItem.tag = tag
        VC?.tabBarItem.selectedImage = UIImage.init(named: selectImage!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        VC?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.RGBA(hex: 0xff6268)], for: UIControlState.selected)
        VC?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.RGBA(hex: 0x878787)], for: UIControlState.normal)
        let nav = UINavigationController.init(rootViewController: VC!)
        self.addChildViewController(nav)
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response

}
