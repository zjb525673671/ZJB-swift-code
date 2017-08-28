//
//  LoginPasswordViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/28.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoginPasswordViewController: BaseViewController, UITextFieldDelegate {

    //MARK: ☸property
    private var backLayer = CAGradientLayer.init()
    private var backButton = UIButton.init(type: UIButtonType.custom)
    private var nextButton = UIButton.init(type: UIButtonType.custom)
    private var forgetButton = UIButton.init(type: UIButtonType.custom)
    private var hiddenButton = UIButton.init(type: UIButtonType.custom)
    private var phoneNumberField = UITextField.init()
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
        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    
    private func xn_initSubViews() {
        let inputLabel = UILabel.init()
        let callLabel = UILabel.init()
        let phoneLine = UIView.init()
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
        self.view.addSubview(self.hiddenButton)
        self.view.addSubview(self.forgetButton)
        self.view.addSubview(self.phoneNumberField)
        self.view.addSubview(phoneLine)
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
            make.top.equalTo(self.view).offset(160*ScaleX)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 20*ScaleX))
        }
        self.hiddenButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-12*ScaleX)
            make.top.equalTo(self.view).offset(155*ScaleX)
            make.size.equalTo(CGSize.init(width: 40*ScaleX, height: 30*ScaleX))
        }
        self.phoneNumberField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.top.equalTo(self.view).offset(187*ScaleX)
            make.height.equalTo(30*ScaleX)
        }
        phoneLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.top.equalTo(self.view).offset(222*ScaleX)
            make.height.equalTo(0.5)
        }
        self.forgetButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-10*ScaleX)
            make.top.equalTo(self.view).offset(228*ScaleX)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 30*ScaleX))
        }
        self.nextButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.bottom.equalTo(self.view).offset(-237*ScaleX)
            make.size.equalTo(CGSize.init(width: 93*ScaleX, height: 33*ScaleX))
        }
        
        inputLabel.xn_init(text: "请输入登录密码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 26*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        callLabel.xn_init(text: "登录密码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 14*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        phoneLine.backgroundColor = UIColor.RGBA(hex: 0xffffff)
        backImageView.image = UIImage.init(named: "login_goBack")
        self.backButton.addTarget(self, action: #selector(self.clickAction_back), for: UIControlEvents.touchUpInside)
        self.hiddenButton.addTarget(self, action: #selector(self.clickAction_hiddenPassword), for: UIControlEvents.touchUpInside)
        self.forgetButton.addTarget(self, action: #selector(self.clickAction_forgetPassword), for: UIControlEvents.touchUpInside)
        self.nextButton.setTitle("下一步>", for: UIControlState.normal)
        self.nextButton.titleLabel?.font = UIFont.regularFont(size: 24*ScaleX)
        self.hiddenButton.setTitle("显示", for: UIControlState.normal)
        self.hiddenButton.titleLabel?.font = UIFont.regularFont(size: 14*ScaleX)
        self.forgetButton.setTitle("忘记密码?", for: UIControlState.normal)
        self.forgetButton.titleLabel?.font = UIFont.regularFont(size: 14*ScaleX)
        self.nextButton.addTarget(self, action: #selector(self.clickAction_nextStep), for: UIControlEvents.touchUpInside)
        self.phoneNumberField.keyboardType = UIKeyboardType.default
        self.phoneNumberField.textColor = UIColor.white
        self.phoneNumberField.delegate = self
        self.phoneNumberField.tintColor = UIColor.white
        self.phoneNumberField.font = UIFont.regularFont(size: 24*ScaleX)
        self.phoneNumberField.isSecureTextEntry = true
        self.phoneNumberField.autocapitalizationType = .none;
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.characters.count)! > 15 && string != "" {
            return false
        }
        return true
    }
    
    //MARK: ☎️notification
    //MARK: 🎬event response
    
    @objc private func clickAction_back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func clickAction_hiddenPassword() {
        self.phoneNumberField.isSecureTextEntry = !self.phoneNumberField.isSecureTextEntry
        if self.phoneNumberField.isSecureTextEntry {
            self.hiddenButton.setTitle("显示", for: UIControlState.normal)
        } else {
            self.hiddenButton.setTitle("隐藏", for: UIControlState.normal)
        }
    }
    
    @objc private func clickAction_forgetPassword() {
        let passwordVC = LoginForgetPasswordViewController()
        self.navigationController?.pushViewController(passwordVC, animated: true)
    }
    
    @objc private func clickAction_nextStep() {
        
    }

}
