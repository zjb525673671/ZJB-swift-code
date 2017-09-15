//
//  LoginMainPresenter.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/30.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoginMainPresenter: NSObject {

    
    var isRegister:Bool = false
    
    /// 查询手机号码是否注册
    ///
    /// - Parameters:
    ///   - phoneNumber: 手机号码
    ///   - callBack: 回调
    public func requestCheckPhoneNumberRegister(phoneNumber:String, callBack:@escaping (_ isSuccess:Bool, _ eMsg:String) -> ()) {
        var dic : [String : String] = [String : String]()
        dic["phoneNum"] = phoneNumber
        dic["appNum"] = "1"
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Login_checkIsRegister_Request, params: dic, success: { (object) in
            if object["data"]["successed"].boolValue
            {
                self.isRegister = true
            }
            else
            {
                self.isRegister = false
            }
            callBack(true, "")
        }) { (error) in
            callBack(false,error)
        }
    }
    
    /// 发送短信
    ///
    /// - Parameters:
    ///   - phoneNumber: 手机号码
    ///   - callBack: 回调
    public func requestSendMessage(phoneNumber:String, callBack:@escaping (_ isSuccess:Bool, _ eMsg:String) -> ()) {
        var dic : [String : String] = [String : String]()
        dic["phoneNum"] = phoneNumber
        dic["channelType"] = "1"
        dic["ip"] = "1"
        dic["blackBox"] = "1"
        dic["appNum"] = "1"
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Login_getMessageCode_Request, params: dic, success: { (object) in
            if object["data"]["successed"].boolValue
            {
                callBack(true, "")
            }
            else
            {
                callBack(false, object["message"].stringValue)
            }
            
        }) { (error) in
            callBack(false,error)
        }
    }
    
    public func reuqestUserLogin(phoneNumber:String, password:String, callBack:@escaping (_ isSuccess:Bool, _ eMsg:String) -> ()) {
        var dic : [String : String] = [String : String]()
        dic["phoneNum"] = phoneNumber
        dic["password"] = password
        dic["ip"] = "0.0.0.0"
        dic["blackBox"] = "1"
        dic["appNum"] = "1"
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Login_UserLogined_Request, params: dic, success: { (object) in
            let loginState = object["data"]["data"]["loginState"]
            if loginState.stringValue == "1"
            {
                XNUserInfo.isLogin = true
                XNUserInfo.phoneNum = object["data"]["data"]["phoneNum"].string
                XNUserInfo.tokenCode = object["data"]["data"]["tokenCode"].string
                XNUserInfo.customId = object["data"]["data"]["customerId"].string
                XNUserInfo.nickName = object["data"]["data"]["nickName"].string
                XNUserInfo.tokenEffective = object["data"]["data"]["tokenEffective"].string
                XNUserInfo.tokenExpired = object["data"]["data"]["tokenExpired"].string
                callBack(true, "")
            }
            else
            {
                callBack(false, object["message"].stringValue)
            }
            
        }) { (error) in
            callBack(false,error)
        }
    }
}
