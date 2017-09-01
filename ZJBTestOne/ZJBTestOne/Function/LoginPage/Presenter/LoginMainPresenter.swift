//
//  LoginMainPresenter.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/30.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class LoginMainPresenter: NSObject {

    public func requestUserIsLogin(phoneNumber:String, callBack:@escaping (_ isSuccess:Bool, _ eMsg:String?) -> ()) {
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Me_NewsList_Request, params: [:], success: { (object) in
            if object.isEmpty {
                callBack(false,"数据错误")
            } else {
                let code:String = object["code"] as! String
                if code == "200" {
                    
                }
            }
        }) { (error) in
            callBack(false,"网络错误")
        }
    }
    public func requestSendMessage(customId:String, callBack:@escaping (_ isSuccess:Bool, _ eMsg:String?) -> ()) {
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Me_NewsList_Request, params: [:], success: { (object) in
            if object.isEmpty {
                callBack(false,"数据错误")
            } else {
                let code:String = object["code"] as! String
                if code == "200" {
                    
                }
            }
        }) { (error) in
            callBack(false,"网络错误")
        }
    }
}
