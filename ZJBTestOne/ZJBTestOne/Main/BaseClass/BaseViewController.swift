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
    
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.base_initSubViews()
        self.base_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func base_initData() {

        if (self.navigationController?.childViewControllers.count)! > 1 {
            let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(base_goBack))
            leftBarBtn.image = UIImage(named: "public_navigition_goBack")
            self.navigationItem.leftBarButtonItem = leftBarBtn
        }
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont.systemFont(ofSize: 18)]
    }
    
    private func base_initSubViews() {
        
    }
    
    func base_goBack(){
        self.navigationController!.popViewController(animated: true)
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    //MARK: 🎬event response
    
}
