//
//  LoginForgetPasswordViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/28.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoginForgetPasswordViewController: BaseViewController, UITextFieldDelegate {

    //MARK: ☸property
    public var phoneNumber : String = ""
    public var verifyCode : String = ""
    private var presenter = LoginMainPresenter.init()
    private var backLayer = CAGradientLayer.init()
    private var backButton = UIButton.init(type: UIButtonType.custom)
    private var nextButton = UIButton.init(type: UIButtonType.custom)
    private var hiddenButton = UIButton.init(type: UIButtonType.custom)
    private var passWordField = UITextField.init()
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
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickAction_endEdit))
        self.view.addGestureRecognizer(tapGesture);
    }
    
    private func xn_initSubViews() {
        let inputLabel = UILabel.init()
        let tipsLabel = UILabel.init()
        let callLabel = UILabel.init()
        let phoneLine = UIView.init()
        let backImageView = UIImageView.init()
        
        self.backLayer.frame = self.view.bounds
        self.backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        self.backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        self.backLayer.colors = [(UIColor.RGBA(hex: 0xf73776).cgColor),(UIColor.RGBA(hex: 0xfa6338).cgColor)]
        self.backLayer.locations = [0.0,1.0]
        self.view.layer.addSublayer(self.backLayer)
        self.view.addSubview(backImageView)
        self.view.addSubview(self.backButton)
        self.view.addSubview(inputLabel)
        self.view.addSubview(tipsLabel)
        self.view.addSubview(callLabel)
        self.view.addSubview(self.hiddenButton)
        self.view.addSubview(self.passWordField)
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
        tipsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.top.equalTo(self.view).offset(128*ScaleX)
            make.height.equalTo(26*ScaleX)
        }
        callLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.top.equalTo(self.view).offset(196*ScaleX)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 20*ScaleX))
        }
        self.hiddenButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-12*ScaleX)
            make.top.equalTo(self.view).offset(191*ScaleX)
            make.size.equalTo(CGSize.init(width: 40*ScaleX, height: 30*ScaleX))
        }
        self.passWordField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.top.equalTo(self.view).offset(228*ScaleX)
            make.height.equalTo(30*ScaleX)
        }
        phoneLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(18*ScaleX)
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.top.equalTo(self.view).offset(263*ScaleX)
            make.height.equalTo(0.5)
        }
        self.nextButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-18*ScaleX)
            make.bottom.equalTo(self.view).offset(-237*ScaleX)
            make.size.equalTo(CGSize.init(width: 93*ScaleX, height: 33*ScaleX))
        }
        
        inputLabel.xn_init(text: "设置密码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 26*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        tipsLabel.xn_init(text: "密码必须为6～16位字符，区分大小写", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 18*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        callLabel.xn_init(text: "密码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 14*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        phoneLine.backgroundColor = UIColor.RGBA(hex: 0xffffff)
        backImageView.image = UIImage.init(named: "login_goBack")
        self.backButton.addTarget(self, action: #selector(self.clickAction_back), for: UIControlEvents.touchUpInside)
        self.hiddenButton.addTarget(self, action: #selector(self.clickAction_hiddenPassword), for: UIControlEvents.touchUpInside)
        self.nextButton.setTitle("下一步>", for: UIControlState.normal)
        self.nextButton.titleLabel?.font = UIFont.regularFont(size: 24*ScaleX)
        self.hiddenButton.setTitle("显示", for: UIControlState.normal)
        self.hiddenButton.titleLabel?.font = UIFont.regularFont(size: 14*ScaleX)
        self.nextButton.addTarget(self, action: #selector(self.clickAction_nextStep), for: UIControlEvents.touchUpInside)
        self.passWordField.keyboardType = UIKeyboardType.default
        self.passWordField.textColor = UIColor.white
        self.passWordField.delegate = self
        self.passWordField.tintColor = UIColor.white
        self.passWordField.font = UIFont.regularFont(size: 24*ScaleX)
        self.passWordField.isSecureTextEntry = true
        self.passWordField.autocapitalizationType = .none;
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! > 15 && string != "" {
            return false
        }
        return true
    }
    
    //MARK: ☎️notification
    //MARK: 🎬event response
    @objc private func clickAction_endEdit() {
        self.view.endEditing(true)
    }
    
    @objc private func clickAction_back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func clickAction_hiddenPassword() {
        self.passWordField.isSecureTextEntry = !self.passWordField.isSecureTextEntry
        if self.passWordField.isSecureTextEntry {
            self.hiddenButton.setTitle("显示", for: UIControlState.normal)
        } else {
            self.hiddenButton.setTitle("隐藏", for: UIControlState.normal)
        }
    }
    
    @objc private func clickAction_nextStep() {
        self.view.endEditing(true)
        XNProgressHUD.showLoading()
        self.presenter.requestForgetPassword(phoneNumber: self.phoneNumber, password: self.passWordField.text!, messageCode: self.verifyCode) { (isSuccess, error) in
            if isSuccess
            {
                self.presenter.requestUserLogin(phoneNumber: self.phoneNumber, password: self.passWordField.text!, messageCode: self.verifyCode, callBack: { (successed, eMsg) in
                    XNProgressHUD.dismissLoading()
                    if successed
                    {
                        self.dismiss(animated: true, completion: nil)
                    }
                    else
                    {
                        XNProgressHUD.showError(error: eMsg)
                    }
                })
            }
            else
            {
                XNProgressHUD.dismissLoading()
                XNProgressHUD.showError(error: error)
            }
        }
    }
}
