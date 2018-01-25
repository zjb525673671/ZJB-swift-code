//
//  QuotaMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class QuotaMainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ☸property
    private var tableView = UITableView.init()
    private var scrollView = UIScrollView.init()
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
    }
    
    private func xn_initSubViews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.tableView)
        self.scrollView.frame = self.view.bounds
        self.scrollView.contentSize = self.view.bounds.size
        self.tableView.frame = CGRect.init(x: 12*ScaleX, y: 300*ScaleX, width: kScreenWidth - 24*ScaleX, height: kScreenHeight - 400*ScaleX)
        self.tableView.register(QuotaMainTaskCell.self, forCellReuseIdentifier: "QuotaMainTaskCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        let backLayer = CAGradientLayer.init()
        backLayer.frame = self.view.bounds
        backLayer.startPoint = CGPoint.init(x: 0, y: 0)
        backLayer.endPoint = CGPoint.init(x: 0, y: 1)
        backLayer.colors = [(UIColor.RGBA(hex: 0xf63875).cgColor),(UIColor.RGBA(hex: 0xf9603c).cgColor)]
        backLayer.locations = [0.0,1.0]
        self.scrollView.layer.addSublayer(backLayer)
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            
        }
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:QuotaMainTaskCell = tableView.dequeueReusableCell(withIdentifier: "QuotaMainTaskCell") as! QuotaMainTaskCell
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
        
    }
    
    //MARK: ☎️notification
    //MARK: 🎬event response

}
