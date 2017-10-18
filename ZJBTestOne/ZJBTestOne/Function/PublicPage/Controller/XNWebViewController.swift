//
//  XNWebViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/10/12.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit
import WebKit

class XNWebViewController: BaseViewController, UIWebViewDelegate {

    //MARK: ☸property
    public var urlStr:String = ""
    public var webTitle:String = ""
    private var webView = UIWebView.init()
    private var wkWebView = WKWebView.init()
    
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.title = self.webTitle
        self.view.backgroundColor = UIColor.white
    }
    
    private func xn_initSubViews() {
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        let requestUrl:URLRequest = URLRequest.init(url: URL.init(string: self.urlStr)!)
        self.webView.loadRequest(requestUrl)
        self.webView.delegate = self
        XNProgressHUD.showLoading()
//        self.view.addSubview(self.wkWebView)
//        self.wkWebView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
//        self.wkWebView.load(requestUrl)
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        XNProgressHUD.dismissLoading()
    }

    //MARK: ☎️notification
    //MARK: 🎬event response

}
