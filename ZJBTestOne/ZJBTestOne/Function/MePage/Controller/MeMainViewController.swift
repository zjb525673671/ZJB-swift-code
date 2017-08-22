//
//  MeMainViewController.swift
//  ZJBTestOne
//
//  Created by 周结兵 on 2017/8/15.
//  Copyright © 2017年 zjb. All rights reserved.
//

import UIKit

class MeMainViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK: ☸property
    var tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.grouped)
    var dataArray = NSMutableArray.init()
    let imageUrlArray = ["me_cell_redPacket","me_cell_jion","me_cell_help","me_cell_service","me_cell_setting"]
    let titleArray = ["我的红包","我参与的活动","帮助中心","联系客服","设置中心"]
    let indexArray = [1,2,1,3,2]
    
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
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.dataArray.removeAllObjects()
        for i in 0...4 {
            let model = MeMainModel.init()
            model.imageIcon = self.imageUrlArray[i]
            model.title = self.titleArray[i]
            model.index = self.indexArray[i]
            if (i==1) || (i==4) {
                model.isHidden = true
            }
            self.dataArray.add(model)
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MeMainHeadCell.self, forCellReuseIdentifier: "MeMainHeadCell")
        self.tableView.register(MeMainNormalCell.self, forCellReuseIdentifier: "MeMainNormalCell")
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    //MARK: 🚪public
    //MARK: 🍐delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return section + 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:MeMainHeadCell = tableView.dequeueReusableCell(withIdentifier: "MeMainHeadCell") as! MeMainHeadCell
            return cell
        }
        let cell:MeMainNormalCell = tableView.dequeueReusableCell(withIdentifier: "MeMainNormalCell") as! MeMainNormalCell
        if indexPath.section == 1 {
            cell.cell_updateData(model: self.dataArray[indexPath.row] as! MeMainModel)
        } else if indexPath.section == 2 {
            cell.cell_updateData(model: self.dataArray[indexPath.row + 2] as! MeMainModel)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 230*ScaleX
        }
        return 53*ScaleX
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12*ScaleX
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: ☎️notification
    //MARK: 🎬event response

}
