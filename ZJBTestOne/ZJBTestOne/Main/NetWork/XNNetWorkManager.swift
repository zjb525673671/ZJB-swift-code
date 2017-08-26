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

let newsListUrl = "http://pre.xnshandai.net/messageCenter/redis/geLoanRecord.do"
let baseChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

private let NetworkRequestShareInstance = XNNetWorkManager()

class XNNetWorkManager {
    class var sharedInstance : XNNetWorkManager {
        return NetworkRequestShareInstance
    }
}

extension XNNetWorkManager {
    
    public func POSTRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        var newDict: [String: Any] = params
        var baseDic : [String : String] = [String : String]()
        baseDic["requestId"] = ""//self.ret32String()
        baseDic["token"] = ""
        baseDic["cid"] = ""
        baseDic["phone"] = ""
        baseDic["osversion"] = "ios"
        baseDic["appversion"] = ""
        baseDic["deviceId"] = ""
        baseDic["sdkversion"] = ""
        baseDic["market"] = "AppStore"
        baseDic["appname"] = "1"
        baseDic["marketName"] = "iOS2"
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: baseDic, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString: String = String(data: jsonData!, encoding: String.Encoding.utf8)!
        newDict["xn_data"] = jsonString
        //使用Alamofire进行网络请求时，调用该方法的参数都是通过getRequest(urlString， params, success :, failture :）传入的，而success传入的其实是一个接受           [String : AnyObject]类型 返回void类型的函数
        Alamofire.request(urlString, method: .post, parameters: newDict)
            .responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    //                    if let value = response.result.value as? [String: AnyObject] {
                    success(value as! [String : AnyObject])
                    //                    }
                    let json = JSON(value)
                    print("请求成功的数据:")
                    print(json)
                    
                case .failure(let error):
                    failture(error)
                    print("error:\(error)")
                    print("分割线*****************")
                    print("error:\(error.localizedDescription)")
                }
        }
    }
    /**
     生成随机字符串,
     
     - parameter length: 生成的字符串的长度
     
     - returns: 随机生成的字符串
     */
//    private func ret32String() -> String{
//        var newStr = ""
//        for _ in 0...31 {
//            let number = 65+arc4random()%26
//            let A = Character(UnicodeScalar(number)!)
//            newStr.append(A)
//        }
//        return newStr
//    }
    
}
