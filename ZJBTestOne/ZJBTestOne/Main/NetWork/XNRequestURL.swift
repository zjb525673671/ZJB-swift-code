//
//  XNNotificationAndURL.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/26.
//  Copyright © 2017年 zjb. All rights reserved.
//

import Foundation

//设置环境的参数, 1:测试环境 2:开发环境 3:预发布环境  4或者其他:生产环境
let EnvironmentIndex:Int = 3

let Environment_BaseURL = XNNetWorkManager.sharedInstance.setEnvironment()//请求头
let Picture_BaseURL = XNNetWorkManager.sharedInstance.setPictureBaseUrl()//图片头
let Html_BaseURL = XNNetWorkManager.sharedInstance.setHtml5BaseUrl()//H5头


//***************** 请求地址 ********************//

//============================== 登录注册 ==============================\\
/** 注册 */
let Login_Register_Request = "userCenter/customer/login.do"

/** 检查登录状态 */
let Login_CheckLogined_Request = "userCenter/customer/login.do"

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

