//
//  ActivityMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/17.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit
import MJRefresh

class ActivityMainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ☸property
    private var tableView = UITableView.init()
    private var noDataView = UIView.init()
    private var presenter = ActivityMainPresenter.init()
    //MARK: ♻️life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xn_initSubViews()
        self.xn_initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.presenter.requestActivityList { (isSuccess, eMsg) in
            if isSuccess {
                if self.presenter.dataArray.count > 0
                {
                    self.tableView.isHidden = false
                    self.noDataView.isHidden = true
                    self.tableView.reloadData()
                }
                else
                {
                    self.tableView.isHidden = true
                    self.noDataView.isHidden = false
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
        
    }
    
    private func xn_initSubViews() {
        let backLayer = CAGradientLayer.init()
        backLayer.frame = self.view.bounds
        backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        backLayer.colors = [(UIColor.RGBA(hex: 0xf63875).cgColor),(UIColor.RGBA(hex: 0xf9603c).cgColor)]
        backLayer.locations = [0.0,1.0]
        let talkLabel = UILabel.init()
        self.view.layer.addSublayer(backLayer)
        self.view.addSubview(self.noDataView)
        self.view.addSubview(self.tableView)
        self.noDataView.addSubview(talkLabel)
        self.noDataView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(12*ScaleX)
            make.top.equalTo(self.view).offset(44)
            make.right.equalTo(self.view).offset(-12*ScaleX)
            make.bottom.equalTo(self.view).offset(-64)
        }
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
            make.top.equalTo(self.view).offset(44*ScaleX)
        }
        talkLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 200*ScaleX, height: 30*ScaleX))
        }
        talkLabel.xn_init(text: "暂无活动~", textAlignment: NSTextAlignment.center, font: UIFont.regularFont(size: 18*ScaleX), textColor: UIColor.RGBA(hex: 0x7a7c7c))
        self.noDataView.isHidden = true
        self.noDataView.backgroundColor = UIColor.white
        self.noDataView.layer.cornerRadius = 4
        self.tableView.register(ActivityMainCell.self, forCellReuseIdentifier: "ActivityMainCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: MainScreenWidth, height: 20*ScaleX))
        self.tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: MainScreenWidth, height: 40*ScaleX))
        self.tableView.mj_header = MJRefreshHeader.init(refreshingTarget: self, refreshingAction: #selector(xn_refresh))
    }
    
    @objc private func xn_refresh() {
        self.presenter.requestActivityList { (isSuccess, eMsg) in
            self.tableView.mj_header.endRefreshing()
            if isSuccess {
                if self.presenter.dataArray.count > 0
                {
                    self.tableView.isHidden = false
                    self.noDataView.isHidden = true
                    self.tableView.reloadData()
                }
                else
                {
                    self.tableView.isHidden = true
                    self.noDataView.isHidden = false
                }
            }
        }
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.dataArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ActivityMainCell = tableView.dequeueReusableCell(withIdentifier: "ActivityMainCell") as! ActivityMainCell
        let model:ActivityMainModel = self.presenter.dataArray[indexPath.row] as! ActivityMainModel
        cell.updateCellData(model: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 112*ScaleX
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:ActivityMainModel = self.presenter.dataArray[indexPath.row] as! ActivityMainModel
//        if model.state == 2
//        {
//            let webVC = XNWebViewController()
//            webVC.urlStr = model.html5Url
//            webVC.webTitle = model.title
//            self.navigationController?.pushViewController(webVC, animated: true)
//        }
//        else if model.state == 1
//        {
//            XNProgressHUD.showError(error: "活动还未开始")
//        }
//        else if model.state == 3
//        {
//            XNProgressHUD.showError(error: "活动已结束")
//        }
        let webVC = XNWebViewController()
        webVC.urlStr = model.html5Url
        webVC.webTitle = model.title
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    //MARK: ☎️notification
    //MARK: 🎬event response

}
