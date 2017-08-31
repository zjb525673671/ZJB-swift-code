//
//  ActivityMainPresenter.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/30.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit
import SwiftyJSON

class ActivityMainPresenter: NSObject {

    public var dataArray = Array<Any>.init()
    
    public func requestActivityList(callBack:@escaping(_ isSuccess:Bool, _ eMsg:String?) -> ()) {
        var baseDic : [String : String] = [String : String]()
        baseDic["clientType"] = "2"
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: "\(Test_Environment)\(Activity_ActivityList_Request)", params: baseDic, success: { (object) in
            let newJson = JSON.init(object)
            let newCode = newJson["code"].intValue
            let message = newJson["message"].stringValue
            if newCode == 200
            {
                //对请求的数据做处理
                let array = newJson["data"]["activitys"].arrayValue
                self.dataArray.removeAll()
                for subJson in array {
                    let model = ActivityMainModel.init()
                    model.imageUrl = "\(Test_PIC_URL)\(subJson["activityPic"].stringValue)"
                    model.peopleCount = subJson["depict"].intValue
                    model.isJion = subJson["isParticipate"].boolValue
                    model.html5Url = subJson["linkAddress"].stringValue
                    self.dataArray.append(model)
                }
                callBack(true, "")
//                for i in 0...newArray.count {
//                    let model = ActivityMainModel.init()
//                    let dic:[String:Any] = newArray[i] as! Dictionary
//                    model.imageUrl = dic["activityPic"] as! String
//                    model.peopleCount = dic["depict"] as! Int
//                    let isParticipate:NSString = dic["isParticipate"] as! NSString
//                    model.isJion = isParticipate.boolValue
//                    model.html5Url = dic["linkAddress"] as! String
//                    self.dataArray.append(model)
//                }
                
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
