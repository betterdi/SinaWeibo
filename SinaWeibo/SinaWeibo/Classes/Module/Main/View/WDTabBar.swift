//
//  WDTabBar.swift
//  SinaWeibo
//
//  Created by 吴迪 on 16/7/18.
//  Copyright © 2016年 wudi. All rights reserved.
//

import UIKit

class WDTabBar: UITabBar {

    
    var composeCallBack: (() -> Void)?
    ///TabBar按钮个数
    let btnNum : Int = 5
    
    ///懒加载发布按钮
    lazy var composeBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: "composeClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
        return btn;
    }()
    
    override func layoutSubviews() {
        let itemWidth = self.frame.size.width / CGFloat(btnNum)
        var itemIndex = 0
        for item in self.subviews {
            let cls = NSClassFromString("UITabBarButton")
            if item.isKindOfClass(cls!) {
                item.frame = CGRect(x: itemWidth * CGFloat(itemIndex), y: 0, width: itemWidth, height: self.frame.height)
                itemIndex++
                if itemIndex == 2 {
                    itemIndex++
                }
            }
        }
        composeBtn.frame = CGRect(x: itemWidth * CGFloat(2), y: 0, width: itemWidth, height: self.frame.height)
    }
    
    func composeClick() {
        composeCallBack?()
    }

}
