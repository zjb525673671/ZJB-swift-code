//
//  ActivityMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/17.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class ActivityMainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ☸property
    private var tableView = UITableView.init()
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        
    }
    //MARK: 🔒private
    private func xn_initData() {
        self.view.backgroundColor = UIColor.white
        XNProgressHUD.showLoading()
        self.presenter.requestActivityList { (isSuccess, eMsg) in
            XNProgressHUD.dismissLoading()
            if isSuccess {
                self.tableView.reloadData()
            }
        }
    }
    
    private func xn_initSubViews() {
        let backLayer = CAGradientLayer.init()
        backLayer.frame = self.view.bounds
        backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        backLayer.colors = [(UIColor.RGBA(hex: 0xf63875).cgColor),(UIColor.RGBA(hex: 0xf9603c).cgColor)]
        backLayer.locations = [0.0,1.0]
        self.view.layer.addSublayer(backLayer)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        self.tableView.register(ActivityMainCell.self, forCellReuseIdentifier: "ActivityMainCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
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
        
    }
    //MARK: ☎️notification
    //MARK: 🎬event response

}
