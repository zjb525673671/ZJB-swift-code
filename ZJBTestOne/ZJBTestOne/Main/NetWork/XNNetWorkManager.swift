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

//定义一个结构体，存储认证相关信息
struct IdentityAndTrust {
    var identityRef:SecIdentity
    var trust:SecTrust
    var certArray:AnyObject
}

extension XNNetWorkManager {
    
    public func POSTRequest(urlString: String, params : [String : Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : String)->()) {
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

//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 20
//        let manager = Alamofire.SessionManager(configuration:configuration)
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        manager.session.configuration.timeoutIntervalForResource = 20
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            if challenge.protectionSpace.authenticationMethod
                == NSURLAuthenticationMethodServerTrust {
                print("服务端证书认证！")
                let serverTrust:SecTrust = challenge.protectionSpace.serverTrust!
                let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)!
                let remoteCertificateData
                    = CFBridgingRetain(SecCertificateCopyData(certificate))!
                let cerPath = Bundle.main.path(forResource: "server", ofType: "cer")!
                let cerUrl = URL(fileURLWithPath:cerPath)
                let localCertificateData = try! Data(contentsOf: cerUrl)
                
                if (remoteCertificateData.isEqual(localCertificateData) == true) {
                    
                    let credential = URLCredential(trust: serverTrust)
                    challenge.sender?.use(credential, for: challenge)
                    return (URLSession.AuthChallengeDisposition.useCredential,
                            URLCredential(trust: challenge.protectionSpace.serverTrust!))
                    
                } else {
                    return (.cancelAuthenticationChallenge, nil)
                }
            }
                //认证客户端证书
            else if challenge.protectionSpace.authenticationMethod
                == NSURLAuthenticationMethodClientCertificate {
                print("客户端证书认证！")
                //获取客户端证书相关信息
                let identityAndTrust:IdentityAndTrust = self.extractIdentity();
                
                let urlCredential:URLCredential = URLCredential(
                    identity: identityAndTrust.identityRef,
                    certificates: identityAndTrust.certArray as? [AnyObject],
                    persistence: URLCredential.Persistence.forSession);
                
                return (.useCredential, urlCredential);
            }
                // 其它情况（不接受认证）
            else {
                print("其它情况（不接受认证）")
                return (.cancelAuthenticationChallenge, nil)
            }
        }
        manager.request("\(Environment_BaseURL)\(urlString)", method: .post, parameters: newDict)
            .responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    let json = JSON(value)
                    let status = json["status"].intValue
                    if status == 404
                    {
                        failture(json["error"].stringValue)
                        print("接口异常的数据:")
                        print(json)
                    }
                    else
                    {
                        let code = json["code"].intValue
                        let message = json["message"].stringValue
                        print("请求成功的数据:")
                        print(json)
                        if code == 1009
                        {
                            XNUserInfo.removeAllKey()
                            //通知重新登录
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoginRegisterShowNotifacation), object: nil)
                            failture("token失效")
                        }
                        else if code == 200
                        {
                            success(json)
                        }
                        else
                        {
                            failture(message)
                        }
                    }
                    
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
    func extractIdentity() -> IdentityAndTrust {
        var identityAndTrust:IdentityAndTrust!
        var securityError:OSStatus = errSecSuccess
        
        let path: String = Bundle.main.path(forResource: "client", ofType: "p12")!
        let PKCS12Data = NSData(contentsOfFile:path)!
        let key : NSString = kSecImportExportPassphrase as NSString
        let options : NSDictionary = [key : "xxxxxxxxxxx"] //客户端证书密码
        //create variable for holding security information
        //var privateKeyRef: SecKeyRef? = nil
        
        var items : CFArray?
        
        securityError = SecPKCS12Import(PKCS12Data, options, &items)
        
        if securityError == errSecSuccess {
            let certItems:CFArray = items as CFArray!;
            let certItemsArray:Array = certItems as Array
            let dict:AnyObject? = certItemsArray.first;
            if let certEntry:Dictionary = dict as? Dictionary<String, AnyObject> {
                // grab the identity
                let identityPointer:AnyObject? = certEntry["identity"];
                let secIdentityRef:SecIdentity = identityPointer as! SecIdentity!
                print("\(identityPointer)  :::: \(secIdentityRef)")
                // grab the trust
                let trustPointer:AnyObject? = certEntry["trust"]
                let trustRef:SecTrust = trustPointer as! SecTrust
                print("\(trustPointer)  :::: \(trustRef)")
                // grab the cert
                let chainPointer:AnyObject? = certEntry["chain"]
                identityAndTrust = IdentityAndTrust(identityRef: secIdentityRef,
                                                    trust: trustRef, certArray:  chainPointer!)
            }
        }
        return identityAndTrust;
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
            return "http://test02.xnshandai.net/"
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
            return "http://image.xnshandai.net/"
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
            return "http://pre.xnshandai.net/"
        } else if EnvironmentIndex == 2  {
            //开发环境
            return "http://h5.xnsudai5.com/"
        } else if EnvironmentIndex == 3  {
            //预发布环境
            return "https://test02.xnsudai.com/"
        } else {
            //生产环境
            return "https://sdai.xnsudai.com/"
        }
    }
}
