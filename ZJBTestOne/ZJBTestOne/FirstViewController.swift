//
//  FirstViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/7/5.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var firstLabel = UILabel();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.firstLabel.frame = CGRect(x: 100, y: 300, width: 60, height: 60)
        self.firstLabel.text = "first income";
        self.firstLabel.font = UIFont.systemFont(ofSize: 14)
        self.firstLabel.textColor = UIColor.blue
        self.view.addSubview(self.firstLabel);
    }

}
