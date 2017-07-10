//
//  ViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2016/11/22.
//  Copyright © 2016年 zjb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var middleLabel : UILabel?
    var nextButton = UIButton.init(type: UIButtonType.custom)
    lazy var titleLabel : UILabel = {
        let _countDownLabel = UILabel.init(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        return _countDownLabel
    }()
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let str: String = NSStringFromClass(self.classForCoder);
        self.xn_initLabel(label: self.titleLabel, text: "xiaoniushandai", textAglignment: NSTextAlignment.center, fontSize: 16, textColor: UIColor.black)
        self.view.addSubview(self.titleLabel)
        print("zhoujiebing"+str);
        NotificationCenter.default.addObserver(self, selector: #selector(self.successNotification(_:)), name: NSNotification.Name(rawValue: "notification"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self);
        let str: String = NSStringFromClass(self.classForCoder);
        print(str);
    }
    //MARK: 🔒private
    //MARK: 🚪public
    //MARK: 🍐delegate
    //MARK: ☎️notification
    
    func successNotification(_ notification: Notification) {
        
    }
    //MARK: 🎬event response
    //MARK: ☸getter and setter

    private func xn_initData() {
    
    }
    
    private func xn_initLabel(label:UILabel, text:String, textAglignment:NSTextAlignment, fontSize:CGFloat, textColor:UIColor) {
        label.textColor = textColor;label.text = text;label.textAlignment = textAglignment;label.font = UIFont.systemFont(ofSize: fontSize)
    }

}

