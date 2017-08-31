//
//  ActivityMainPresenter.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/30.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class ActivityMainPresenter: NSObject {

    public var dataArray = Array<Any>.init()
    
    public func requestActivityList(callBack:@escaping(_ isSuccess:Bool, _ eMsg:String?) -> ()) {
        var baseDic : [String : String] = [String : String]()
        baseDic["clientType"] = "2"
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: "\(Test_Environment)\(Activity_ActivityList_Request)", params: baseDic, success: { (object) in
            let code:String = (String)(describing: object["code"])
            let message:String = (String)(describing: object["message"])
            if code == "200"
            {
                //对请求的数据做处理
                let newArray:[Any] = object["data"]!["activitys"] as! [Any]
                self.dataArray.removeAll()
                for i in 0...newArray.count {
                    let model = ActivityMainModel.init()
                    let dic:[String:Any] = newArray[i] as! Dictionary
                    model.imageUrl = dic["activityPic"] as! String
                    model.peopleCount = dic["depict"] as! Int
                    let isParticipate:NSString = dic["isParticipate"] as! NSString
                    model.isJion = isParticipate.boolValue
                    model.html5Url = dic["linkAddress"] as! String
                    self.dataArray.append(model)
                }
                callBack(true, "")
            }
            else
            {
                callBack(false, message)
            }
        }) { (error) in
            callBack(false, "服务异常")
        }
    }
}
