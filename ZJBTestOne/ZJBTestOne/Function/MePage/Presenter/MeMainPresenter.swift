//
//  MeMainPresenter.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/23.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class MeMainPresenter: NSObject {

    public func requestNewsList(callBack : @escaping (_ isSuccess:Bool, _ eMsg:String)->()) {
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Loan_NewsList_Request, params: [:], success: { (object) in
            let code:String = (String)(describing: object["code"])
            let message:String = (String)(describing: object["message"])
            if code == "200"
            {
                //对请求的数据做处理
                callBack(true, "")
            }
            else
            {
                callBack(false, message)
            }
        }) { (eMsg) in
            callBack(false, eMsg)
        }
    }
    
    public func requestUserLoginOut(callBack : @escaping (_ isSuccess:Bool, _ eMsg:String)->()) {
        var dic : [String : String] = [String : String]()
        dic["token"] = XNUserInfo.tokenCode
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Login_UserLoginOut_Request, params: dic, success: { (object) in
            if object["data"]["successed"].boolValue || object["code"].intValue == 1009
            {
                callBack(true, "")
            }
            else
            {
                callBack(false, object["message"].stringValue)
            }
        }) { (eMsg) in
            callBack(false, eMsg)
        }
    }
}
