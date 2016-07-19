//
//  WDVisitorView.swift
//  SinaWeibo
//
//  Created by 吴迪 on 16/7/18.
//  Copyright © 2016年 wudi. All rights reserved.
//

import UIKit

class WDVisitorView: UIView {

    // 一个view从storyboard或xib, 系统认为即要能用代码也要能从storyboard或xib
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 实现init(frame)
    // 子类实现了构造函数,就不会继承父类的构造函数,系统会提示加上 init?(coder aDecoder: NSCoder) 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        self.setupUI()
    }
    
    /**
     设置UI界面
     */
     // private 只有当前文件可以访问,其他文件无法访问
    private func setupUI() {
        // 添加子控件
        self.addSubview(iconView)
        self.addSubview(houseView)
        self.addSubview(messageLabel)
        self.addSubview(registerButton)
        self.addSubview(loginButton)
        
        // 设置约束
        // 使用纯代码约束需要关闭Autoresizing的影响
        iconView.translatesAutoresizingMaskIntoConstraints = false
        houseView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        /// 转轮
        /// CenterX和父控件的CenterX重合
        // NSLayoutConstraint一个约束对象
        /*
        参数:
        1.item: 要约束的view
        2.attribute: 要约束对象的那个属性
        3.relatedBy: 参照关系
        4.toItem: 要参照的view
        5.attribute: 要参照view的那个属性
        */
        // 将约束添加到view上面
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        /// CenterY和父控件的CenterY重合往上面偏移40
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -40))
        
        // 房子 CenterX
        // 往父控件添加约束
        self.addConstraint(NSLayoutConstraint(item: houseView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        // 房子 CenterY
        self.addConstraint(NSLayoutConstraint(item: houseView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        
        // 消息label CenterX
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        // 消息label Top到iconView底部
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        // 消息label 宽度
        // 当 toItem = nil, attribute = NotAnAttribute
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 260))
        
        // 注册按钮
        // 按照文字的书写顺序: Leading, Trailing
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
        
        // 登录按钮
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
    }
    
    // MARK: - 懒加载
    /// 转轮
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    /// 小房子
    private lazy var houseView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    /// 消息label
    private lazy var messageLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        
        // 设置
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(15)
        label.textColor = UIColor.darkGrayColor()
        label.numberOfLines = 0
        label.text = "关注一些人,看看有什么惊喜!关注一些人,看看有什么惊喜!关注一些人,看看有什么惊喜!关注一些人,看看有什么惊喜!关注一些人,看看有什么惊喜!"
        // 让控件size根据内容自己调整
        label.sizeToFit()
        
        return label
    }()
    
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        
        // 设置
        button.setTitle("注册", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(18)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        return button
    }()
    
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: UIButtonType.Custom)
        
        // 设置
        button.setTitle("登录", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(18)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        
        return button
    }()

}
