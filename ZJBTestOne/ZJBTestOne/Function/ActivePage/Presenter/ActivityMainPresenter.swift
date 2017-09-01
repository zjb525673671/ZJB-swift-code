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
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: Activity_ActivityList_Request, params: baseDic, success: { (object) in
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
                    model.imageUrl = "\(Picture_BaseURL)\(subJson["activityPic"].stringValue)"
                    model.peopleCount = subJson["depict"].intValue
                    model.isJion = subJson["isParticipate"].boolValue
                    model.html5Url = subJson["linkAddress"].stringValue
                    self.dataArray.append(model)
                }
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
}
