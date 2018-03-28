//
//  MeSettingViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/10/16.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class MeSettingViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ☸property
    private var tableView = UITableView.init()
    private var footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: MainScreenWidth, height: 116*ScaleX))
    private var loginOutButton = UIButton.init(type: UIButtonType.custom)
    private var presenter = MeMainPresenter.init()
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
        self.view.backgroundColor = UIColor.white
        self.title = "设置"
    }
    
    private func xn_initSubViews() {
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        self.tableView.register(MeSettingCell.self, forCellReuseIdentifier: "MeSettingCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.footerView.addSubview(self.loginOutButton)
        self.loginOutButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.footerView)
            make.top.equalTo(self.footerView).offset(37*ScaleX)
            make.size.equalTo(CGSize.init(width: 274*ScaleX, height: 42*ScaleX))
        }
        self.loginOutButton.layer.cornerRadius = 21*ScaleX
        self.loginOutButton.layer.borderWidth = 1
        self.loginOutButton.layer.borderColor = UIColor.RGBA(hex: 0xbdbcbc).cgColor
        self.loginOutButton.setTitle("安全退出", for: UIControlState.normal)
        self.loginOutButton.setTitleColor(UIColor.RGBA(hex: 0x7a7c7c), for: UIControlState.normal)
        self.loginOutButton.titleLabel?.font = UIFont.regularFont(size: 16*ScaleX)
        self.loginOutButton.addTarget(self, action: #selector(clickAction_safeLoginOut), for: UIControlEvents.touchUpInside)
        self.tableView.tableFooterView = self.footerView
        
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MeSettingCell = tableView.dequeueReusableCell(withIdentifier: "MeSettingCell") as! MeSettingCell
        cell.cell_updateData(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44*ScaleX
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
            let webVC = XNWebViewController()
            webVC.urlStr = "\(Html_BaseURL)FlashLoanH5/html/page/my/about_us.html?appVersion=\(version ?? "")"
            webVC.webTitle = "关于我们"
            self.navigationController?.pushViewController(webVC, animated: true)
        }
    }
    //MARK: ☎️notification
    //MARK: 🎬event response
    @objc private func clickAction_safeLoginOut() {
        self.navigationController?.popViewController(animated: true)
        self.presenter.requestUserLoginOut { (isSuccess, eMsg) in
            if isSuccess
            {
                self.navigationController?.popViewController(animated: true)
                XNUserInfo.removeAllKey()
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: LoginRegisterShowNotifacation), object: nil)
            }
            else
            {
                XNProgressHUD.showError(error: eMsg)
            }
        }
    }

}
