//
//  WDBaseTableViewController.swift
//  SinaWeibo
//
//  Created by 吴迪 on 16/7/18.
//  Copyright © 2016年 wudi. All rights reserved.
//

import UIKit

class WDBaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    /// 用户是否登陆
    var userLogin = false
    
    override func loadView() {
        if userLogin {
            // 已经登陆, 不用处理
            super.loadView()
        } else {
            self.view = visitorView
        }
    }
    
    // MARK: - 懒加载
    /// 访客视图
    lazy var visitorView: WDVisitorView = WDVisitorView()

}
