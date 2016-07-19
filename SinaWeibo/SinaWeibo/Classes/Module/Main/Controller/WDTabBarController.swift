//
//  WDTabBarController.swift
//  SinaWeibo
//
//  Created by 吴迪 on 16/7/18.
//  Copyright © 2016年 wudi. All rights reserved.
//

import UIKit

class WDTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //首页
        let homeVc = WDBaseTableViewController()
        self.addChildViewController(homeVc, title: "首页", normalImageName: "tabbar_home")
        //消息
        let msgVc = UIViewController()
        self.addChildViewController(msgVc, title: "消息", normalImageName: "tabbar_message_center")
        //发现
        let discoveryVc = UIViewController()
        self.addChildViewController(discoveryVc, title: "发现", normalImageName: "tabbar_discover")
        //我
        let meVc = UIViewController()
        self.addChildViewController(meVc, title: "我", normalImageName: "tabbar_profile")
        //设置tabBar
        let tabBar = WDTabBar()
        tabBar.composeCallBack = { () -> Void in
            print("你点击了按钮")
        }
        self.setValue(tabBar, forKey: "tabBar")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     加入子控制器
     
     - author: wudi
     - date: 16-07-18 20:07:36
     
     - parameter viewController:  要加入的子控制器
     - parameter title:           标题
     - parameter normalImageName: normal状态图片名称
     */
    private func addChildViewController(viewController: UIViewController,title: String,normalImageName: String) {
            viewController.title = title
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], forState: UIControlState.Selected)
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.darkGrayColor()], forState: UIControlState.Normal)
        viewController.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(14)], forState: UIControlState.Normal)
        viewController.tabBarItem.image = UIImage(named: normalImageName)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: normalImageName + "_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.addChildViewController(UINavigationController(rootViewController: viewController))
    }
}
