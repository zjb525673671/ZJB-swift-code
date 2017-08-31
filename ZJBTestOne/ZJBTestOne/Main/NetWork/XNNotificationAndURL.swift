//
//  XNNotificationAndURL.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/26.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

let Test_Environment = "http://pre.xnshandai.net/" //测试环境
let Test_PIC_URL = "http://image.xnshandai.net/"//图片
let Test_H5_WEBURL = "http://h5.xnsudai5.com/"//H5

let Develop_Environment = "http://test.xnsudai5.com/" //开发环境
let Develop_PIC_URL = "http://h5.xnsudai5.com/"
let Develop_H5_WEBURL = "http://h5.xnsudai5.com/"

let Prepa_Environment = "http://pre.xnshandai.com/" //预发布环境
let Prepa_PIC_URL = "http://image.xnshandai.com/"
let Prepa_H5_WEBURL = "https://sdai.xnsudai.com/"

let Product_Environment = "https://sdai.xnsudai.com/" //生产环境
let Product_PIC_URL = "http://image.xnshandai.com/"
let Product_H5_WEBURL = "https://sdai.xnsudai.com/"

//***************** 通知 ********************//

//============================== 登录 ==============================\\

let LoginRegisterShowNotifacation = "LoginRegisterShowNotifacation"

//============================== 贷款 ==============================\\


//***************** 请求地址 ********************//

//============================== 贷款 ==============================\\

/** 贷款消息列表 */
let Loan_NewsList_Request = "messageCenter/redis/getLoanRecord.do"

//============================== 提额 ==============================\\

/** 提额消息列表 */
let Quota_NewsList_Request = "messageCenter/redis/getLoanRecord.do"

//============================== 活动 ==============================\\

/** 活动列表 */
let Activity_ActivityList_Request = "activityCenter/activity/getActivityList.do"

//============================== 我的 ==============================\\

/** 消息列表 */
let Me_NewsList_Request = "messageCenter/redis/getLoanRecord.do"

