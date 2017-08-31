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
        XNNetWorkManager.sharedInstance.POSTRequest(urlString: newsListUrl, params: [:], success: { (object) in
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
}
