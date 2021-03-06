//
//  LoginMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/26.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoginMainViewController: BaseViewController, UITextFieldDelegate {

    //MARK: ☸property
    private var backLayer = CAGradientLayer.init()
    private var xView = UIView.init()
    private var backButton = UIButton.init(type: UIButtonType.custom)
    private var nextButton = UIButton.init(type: UIButtonType.custom)
    private var phoneNumberField = UITextField.init()
    private var presenter = LoginMainPresenter.init()
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
        XNUserInfo.isLoginPageShow = false
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickAction_endEdit))
        self.view.addGestureRecognizer(tapGesture);
        let deviceName = UIDevice.current.name
        let width = kScreenHeight
        print(deviceName)
        print(width)
    }
    
    private func xn_initSubViews() {
        let inputLabel = UILabel.init()
        let callLabel = UILabel.init()
        let phoneLine = UIView.init()
        let backImageView = UIImageView.init()
        
        self.backLayer.frame = self.view.bounds
        self.backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        self.backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        self.backLayer.colors = [(UIColor.layerStartColor().cgColor),(UIColor.layerEndColor().cgColor)]
        self.backLayer.locations = [0.0,1.0]
        self.view.layer.addSublayer(self.backLayer)
        self.view.addSubview(self.xView)
        
        self.xView.addSubview(backImageView)
        self.xView.addSubview(self.backButton)
        self.xView.addSubview(inputLabel)
        self.xView.addSubview(callLabel)
        self.xView.addSubview(self.phoneNumberField)
        self.xView.addSubview(phoneLine)
        self.xView.addSubview(self.nextButton)
        let topD = XNHelper.help_topistance()
        self.xView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(topD)
            make.left.right.bottom.equalTo(self.view)
        }
        backImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.xView).offset(18*ScaleX)
            make.top.equalTo(self.xView).offset(30*ScaleX)
            make.size.equalTo(CGSize.init(width: 10.5*ScaleX, height: 18.5*ScaleX))
        }
        self.backButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.xView)
            make.top.equalTo(self.xView).offset(20*ScaleX)
            make.size.equalTo(CGSize.init(width: 50*ScaleX, height: 40*ScaleX))
        }
        inputLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.xView).offset(18*ScaleX)
            make.top.equalTo(self.xView).offset(80*ScaleX)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 36*ScaleX))
        }
        callLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.xView).offset(18*ScaleX)
            make.top.equalTo(self.xView).offset(160*ScaleX)
            make.size.equalTo(CGSize.init(width: 80*ScaleX, height: 20*ScaleX))
        }
        self.phoneNumberField.snp.makeConstraints { (make) in
            make.left.equalTo(self.xView).offset(18*ScaleX)
            make.right.equalTo(self.xView).offset(-18*ScaleX)
            make.top.equalTo(self.xView).offset(187*ScaleX)
            make.height.equalTo(30*ScaleX)
        }
        phoneLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.xView).offset(18*ScaleX)
            make.right.equalTo(self.xView).offset(-18*ScaleX)
            make.top.equalTo(self.xView).offset(222*ScaleX)
            make.height.equalTo(0.5)
        }
        self.nextButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.xView).offset(-18*ScaleX)
            make.top.equalTo(self.xView).offset(400*ScaleX)
            make.size.equalTo(CGSize.init(width: 93*ScaleX, height: 33*ScaleX))
        }
        
        inputLabel.xn_init(text: "请输入手机号码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 26*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        callLabel.xn_init(text: "电话号码", textAlignment: NSTextAlignment.left, font: UIFont.regularFont(size: 14*ScaleX), textColor: UIColor.RGBA(hex: 0xffffff))
        phoneLine.backgroundColor = UIColor.RGBA(hex: 0xffffff)
        backImageView.image = UIImage.init(named: "login_goBack")
//        self.backButton.backgroundColor = UIColor.blue
        self.backButton.addTarget(self, action: #selector(self.clickAction_back), for: UIControlEvents.touchUpInside)
        self.nextButton.setTitle("下一步>", for: UIControlState.normal)
        self.nextButton.titleLabel?.font = UIFont.regularFont(size: 24*ScaleX)
        self.nextButton.addTarget(self, action: #selector(self.clickAction_nextStep), for: UIControlEvents.touchUpInside)
        self.phoneNumberField.keyboardType = UIKeyboardType.numberPad
        self.phoneNumberField.textColor = UIColor.white
        self.phoneNumberField.delegate = self
        self.phoneNumberField.tintColor = UIColor.white
        self.phoneNumberField.font = UIFont.regularFont(size: 24*ScaleX)
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! > 10 && string != "" {
            return false
        }
        return true
    }
    
    //MARK: ☎️notification
    //MARK: 🎬event response

    @objc private func clickAction_endEdit() {
        self.view.endEditing(true);
    }

    @objc private func clickAction_back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func clickAction_nextStep() {
//        self.phoneNumberField.resignFirstResponder()
//        let messageVC = LoginMessageViewController()
//        messageVC.phoneNumber = "13701728195"
//        self.navigationController?.pushViewController(messageVC, animated: true)
//        return
        
        if (self.phoneNumberField.text?.count)! < 11
        {
            //tips提示
            print("手机号码错误")
            XNProgressHUD.showError(error: "手机号码错误,请从新输入")
            return
        }
        else
        {
            XNProgressHUD.showLoading()
            self.presenter.requestCheckPhoneNumberRegister(phoneNumber: self.phoneNumberField.text!, callBack: { (isSuccess, eMsg) in
                XNProgressHUD.dismissLoading()
                if isSuccess
                {
                    if self.presenter.isRegister
                    {
                        
                        let passwordVC = LoginPasswordViewController()
                        passwordVC.phoneNumber = self.phoneNumberField.text!
                        self.navigationController?.pushViewController(passwordVC, animated: true)
                    }
                    else
                    {
                        let messageVC = LoginMessageViewController()
                        messageVC.phoneNumber = self.phoneNumberField.text!
                        self.navigationController?.pushViewController(messageVC, animated: true)
                    }
                }
                else
                {
                    XNProgressHUD.showError(error: eMsg)
                    //tips提示
                }
            })
        }
    }
}
