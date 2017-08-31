//
//  LoginUserModel.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/31.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

//单例,全局用户的信息数据
let XNUserInfo = LoginUserModel()

class LoginUserModel: NSObject {
    class var sharedInfo: LoginUserModel {
        return XNUserInfo
    }
    //客户的唯一id
    var customId:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_customId") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_customId")
            }
        }
    }
    //客户手机号码
    var phoneNum:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_phoneNum") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_phoneNum")
            }
        }
    }
    //客户的token
    var tokenCode:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_tokenCode") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_tokenCode")
            }
        }
    }
    //客户昵称
    var nickName:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_nickName") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_nickName")
            }
        }
    }
    //客户的登录有效时间
    var tokenEffective:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_tokenEffective") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_tokenEffective")
            }
        }
    }
    //
    var tokenExpired:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_tokenExpired") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_tokenExpired")
            }
        }
    }
    
    var userAvatar:String? {
        get{
            return UserDefaults.standard.object(forKey: "user_key_userAvatar") as? String
        }
        set{
            if (newValue?.isEmpty)! == false {
                UserDefaults.standard.set(newValue, forKey: "user_key_userAvatar")
            }
        }
    }
}
