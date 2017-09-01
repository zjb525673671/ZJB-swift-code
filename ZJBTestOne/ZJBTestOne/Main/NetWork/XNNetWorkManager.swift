//
//  XNNetWorkManager.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/22.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let NetworkRequestShareInstance = XNNetWorkManager()

class XNNetWorkManager {
    class var sharedInstance : XNNetWorkManager {
        return NetworkRequestShareInstance
    }
}

extension XNNetWorkManager {
    
    public func POSTRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : String)->()) {
        var newDict: [String: Any] = params
        var baseDic : [String : String] = [String : String]()
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        
        //随机32位大写字符串
        baseDic["requestId"] = self.ret32String()
        //用户token
        baseDic["token"] = XNUserInfo.tokenCode
        //用户customId
        baseDic["cid"] = XNUserInfo.customId
        //用户手机号
        baseDic["phone"] = XNUserInfo.phoneNum
        //iOS系统
        baseDic["osversion"] = "ios"
        //APP版本号
        baseDic["appversion"] = version as? String
        //手机的UUID
        baseDic["deviceId"] = UIDevice.current.identifierForVendor?.uuidString
        //手机的系统版本
        baseDic["sdkversion"] = UIDevice.current.systemVersion
        //App Store
        baseDic["market"] = "AppStore"
        baseDic["appname"] = "1"
        baseDic["marketName"] = "iOS2"
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: baseDic, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString: String = String(data: jsonData!, encoding: String.Encoding.utf8)!
        newDict["xn_data"] = jsonString

        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        manager.request("\(Environment_BaseURL)\(urlString)", method: .post, parameters: newDict)
            .responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    success(value as! [String : AnyObject])
                    let json = JSON(value)
                    let code = json["code"].intValue
                    if code == 1009 {
                        XNUserInfo.removeAllKey()
                        
                    }
                    print("请求成功的数据:")
                    print(json)
                    
                case .failure(let error):
                    var errorMessage = ""
                    if error._code == -1009 {
                        errorMessage = "没有网络"
                    } else if error._code == -1001 {
                        errorMessage = "连接超时"
                    } else {
                        errorMessage = "网络异常"
                    }
                    failture(errorMessage)
                    print("error:\(error)错误原因:\(errorMessage)")
                }
        }
    }
    
    private func ret32String() -> String {
        var newStr = ""
        
        for _ in 0...31 {
            let number = 65+arc4random()%26
            let A = Character(UnicodeScalar(number)!)
            newStr.append(A)
        }
        print(newStr)
        return newStr
    }
    
    /// 请求地址头
    ///
    /// - Returns: 请求地址头
    public func setEnvironment() -> String {
        if EnvironmentIndex == 1 {
            //测试环境
            return "http://pre.xnshandai.net/"
        } else if EnvironmentIndex == 2  {
            //开发环境
            return "http://test.xnsudai5.com/"
        } else if EnvironmentIndex == 3  {
            //预发布环境
            return "http://pre.xnshandai.com/"
        } else {
            //生产环境
            return "https://sdai.xnsudai.com/"
        }
    }
    
    
    /// 图片地址头
    ///
    /// - Returns: 基础图片地址头
    public func setPictureBaseUrl() -> String {
        if EnvironmentIndex == 1 {
            //测试环境
            return "http://image.xnshandai.net/"
        } else if EnvironmentIndex == 2  {
            //开发环境
            return "http://h5.xnsudai5.com/"
        } else if EnvironmentIndex == 3  {
            //预发布环境
            return "http://image.xnshandai.com/"
        } else {
            //生产环境
            return "http://image.xnshandai.com/"
        }
    }
    
    
    /// html5头
    ///
    /// - Returns: html5头
    public func setHtml5BaseUrl() -> String {
        if EnvironmentIndex == 1 {
            //测试环境
            return "http://h5.xnsudai5.com/"
        } else if EnvironmentIndex == 2  {
            //开发环境
            return "http://h5.xnsudai5.com/"
        } else if EnvironmentIndex == 3  {
            //预发布环境
            return "https://sdai.xnsudai.com/"
        } else {
            //生产环境
            return "https://sdai.xnsudai.com/"
        }
    }
}
