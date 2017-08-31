//
//  LoginMessageViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/28.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}

class LoginMessageViewController: BaseViewController, UITextFieldDelegate {

    //MARK: ☸property
    private var backLayer = CAGradientLayer.init()
    private var backButton = UIButton.init(type: UIButtonType.custom)
    private var nextButton = UIButton.init(type: UIButtonType.custom)
    private var phoneNumberField = CustomTextField.init()
    private var countDownButton = UIButton.init()
    
    private var firstCodeLabel = UILabel.init()
    private var secondCodeLabel = UILabel.init()
    private var thirdCodeLabel = UILabel.init()
    private var forthCodeLabel = UILabel.init()
    private var timer:Timer? = Timer.init()
    
    private var seconds:Int = 60
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.timer?.invalidate()
        self.timer = nil
        self.countDownButton.isEnabled = true
        self.countDownButton.setTitle("重新获取验证码", for: UIControlState.normal)
        self.countDownButton.setTitleColor(UIColor.RGBA(hex: 0xffffff, alpha: 1), for: UIControlState.normal)
        self.seconds = 60
        print("我消失了哦")
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    
    private func xn_initSubViews() {
        let inputLabel = UILabel.init()
        let callLabel = UILabel.init()
        let backImageView = UIImageView.init()
        
        self.backLayer.frame = self.view.bounds
        self.backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        self.backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        self.backLayer.colors = [(UIColor.RGBA(hex: 0xf73776).cgColor),(UIColor.RGBA(hex: 0xfa6338).cgColor)]
        self.backLayer.locations = [0.0,1.0]
        self.view.layer .addSublayer(self.backLayer)
        
        self.view.addSubview(backImageView)
        self.view.addSubview(self.backButton)
        self.view.addSubview(inputLabel)
        self.view.addSubview(callLabel)
        self.view.addSubview(self.countDownButton)
        self.view.addSubview(self.firstCodeLabel)
        self.view.addSubview(self.secondCodeLabel)
        self.view.addSubview(self.thirdCodeLabel)
        self.view.addSubview(self.forthCodeLabel)
        self.view.addSubview(self.phoneNumberField)
        self.view.addSubview(self.nextButton)
        
        backImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.top.equalTo(self.view).offset(30*ScaleX)
            make.size.equalTo(CGSize.init(width: 10.5*ScaleX, height: 18.5*ScaleX))
        }
        self.backButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view).offset(20*ScaleX)
            make.size.equalTo(CGSize.init(width: 50*ScaleX, height: 40*ScaleX))
        }
        inputLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.top.equalTo(self.view).offset(80*ScaleX)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 36*ScaleX))
        }
        callLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.top.equalTo(self.view).offset(130*ScaleX)
            make.size.equalTo(CGSize.init(width: 110*ScaleX, height: 25*ScaleX))
        }
        self.countDownButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(143*ScaleX)
            make.top.equalTo(self.view).offset(130*ScaleX)
            make.size.equalTo(CGSize.init(width: 110*ScaleX, height: 25*ScaleX))
        }
        self.firstCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.top.equalTo(self.view).offset(195*ScaleX)
            make.size.equalTo(CGSize.init(width: 60*ScaleX, height: 60*ScaleX))
        }
        self.secondCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.firstCodeLabel.snp.right).offset(21*ScaleX)
            make.top.equalTo(self.view).offset(195*ScaleX)
            make.size.equalTo(CGSize.init(width: 60*ScaleX, height: 60*ScaleX))
        }
        self.thirdCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.secondCodeLabel.snp.right).offset(21*ScaleX)
            make.top.equalTo(self.view).offset(195*ScaleX)
            make.size.equalTo(CGSize.init(width: 60*ScaleX, height: 60*ScaleX))
        }
        self.forthCodeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.thirdCodeLabel.snp.right).offset(21*ScaleX)
            make.top.equalTo(self.view).offset(195*ScaleX)
            make.size.equalTo(CGSize.init(width: 60*ScaleX, height: 60*ScaleX))
        }
        
        self.phoneNumberField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.centerY.equalTo(self.firstCodeLabel)
            make.height.equalTo(60*ScaleX)
        }
        self.nextButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.bottom.equalTo(self.view).offset(-237*ScaleX)
            make.size.equalTo(CGSize.init(width: 93*ScaleX, height: 33*ScaleX))
        }
        
        inputLabel.xn_init(text: "输入验证码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 26*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        callLabel.xn_init(text: "13701728194", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 18*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        self.initLabel(self.firstCodeLabel, true)
        self.initLabel(self.secondCodeLabel, false)
        self.initLabel(self.thirdCodeLabel, false)
        self.initLabel(self.forthCodeLabel, false)
        backImageView.image = UIImage.init(named: "login_goBack")
        self.backButton.addTarget(self, action: #selector(self.clickAction_back), for: UIControlEvents.touchUpInside)
        self.nextButton.setTitle("下一步>", for: UIControlState.normal)
        self.nextButton.titleLabel?.font = UIFont.regularFont(size: 24*ScaleX)
        self.nextButton.addTarget(self, action: #selector(self.clickAction_nextStep), for: UIControlEvents.touchUpInside)
        self.countDownButton.setTitle("获取验证码", for: UIControlState.normal)
        self.countDownButton.titleLabel?.font = UIFont.regularFont(size: 14*ScaleX)
        self.countDownButton.setTitleColor(UIColor.RGBA(hex: 0xffffff, alpha: 1), for: UIControlState.normal)
        self.countDownButton.addTarget(self, action: #selector(self.clickAction_sendMessage), for: UIControlEvents.touchUpInside)
        self.phoneNumberField.keyboardType = UIKeyboardType.numberPad
        self.phoneNumberField.textColor = UIColor.clear
        self.phoneNumberField.delegate = self
        self.phoneNumberField.tintColor = UIColor.clear
    }
    
    private func initLabel(_ label: UILabel, _ isShow: Bool) {
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.mediumFont(size: 40*ScaleX)
        label.textColor = UIColor.RGBA(hex: 0xffffff)
        label.layer.cornerRadius = 2
        label.layer.borderWidth = 1
        if isShow {
            label.layer.borderColor = UIColor.white.cgColor
        } else {
            label.layer.borderColor = UIColor.RGBA(hex: 0xffffff, alpha: 0.5).cgColor
        }
    }
    
    //MARK: 🚪public
    //MARK: 🍐delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let length:Int = (textField.text?.characters.count)!
        
        
        if length == 0 {
            if string == "" {
                self.firstCodeLabel.text = ""
            } else {
                self.firstCodeLabel.text = string
                self.secondCodeLabel.layer.borderColor = UIColor.white.cgColor
            }
        }
        if length == 1 {
            if string == "" {
                self.firstCodeLabel.text = ""
                self.secondCodeLabel.layer.borderColor = UIColor.RGBA(hex: 0xffffff, alpha: 0.5).cgColor
            } else {
                self.secondCodeLabel.text = string
                self.thirdCodeLabel.layer.borderColor = UIColor.white.cgColor
            }
        }
        if length == 2 {
            if string == "" {
                self.secondCodeLabel.text = ""
                self.thirdCodeLabel.layer.borderColor = UIColor.RGBA(hex: 0xffffff, alpha: 0.5).cgColor
            } else {
                self.thirdCodeLabel.text = string
                self.forthCodeLabel.layer.borderColor = UIColor.white.cgColor
            }
        }
        if length == 3 {
            if string == "" {
                self.thirdCodeLabel.text = ""
                self.forthCodeLabel.layer.borderColor = UIColor.RGBA(hex: 0xffffff, alpha: 0.5).cgColor
            } else {
                self.forthCodeLabel.text = string
            }
        }
        if length == 4 {
            if string == "" {
                self.forthCodeLabel.text = ""
            }
        }
        if (length > 3 && string != "") {
            return false
        }
        return true
    }
    
    //MARK: ☎️notification
    //MARK: 🎬event response
    
    @objc private func clickAction_back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func clickAction_nextStep() {
        let passwordVC = LoginPasswordViewController()
        self.navigationController?.pushViewController(passwordVC, animated: true)
    }
    
    @objc private func clickAction_sendMessage() {
        //发送短信验证码
        print("短信验证码发送成功!")
        self.countDownButton.isEnabled = false
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timer_countTime(timer:)), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer!, forMode: RunLoopMode.commonModes)
        self.countDownButton.setTitle("60秒后重新获取", for: UIControlState.normal)
        self.countDownButton.setTitleColor(UIColor.RGBA(hex: 0xffffff, alpha: 0.5), for: UIControlState.normal)
    }
    
    @objc private func timer_countTime(timer:Timer) {
        //短信倒计时
        self.seconds -= 1
        if self.seconds < 1 {
            self.timer?.invalidate()
            self.timer = nil
            self.countDownButton.isEnabled = true
            self.countDownButton.setTitle("重新获取验证码", for: UIControlState.normal)
            self.countDownButton.setTitleColor(UIColor.RGBA(hex: 0xffffff, alpha: 1), for: UIControlState.normal)
            self.seconds = 60
        }
        else
        {
            self.countDownButton.setTitle( "\(self.seconds)秒后重新获取", for: UIControlState.normal)
//            self.countDownButton.setTitleColor(UIColor.RGBA(hex: 0xffffff, alpha: 0.5), for: UIControlState.normal)
        }
    }

}
