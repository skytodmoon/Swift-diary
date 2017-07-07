//
//  QJLTabBar.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class QJLTabBar: UITabBar {
    
    let plusButton = UIButton.init(type: .Custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /*添加加号按钮*/
        plusButton.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: .Normal)
        plusButton.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: .Highlighted)
        plusButton.addTarget(self, action: #selector(QJLTabBar.presentView), forControlEvents: .TouchUpInside)
        addSubview(plusButton)
        
        backgroundImage = UIImage.init(named: "tabbar-light")
    }
    
    func presentView() {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(PublishController(), animated: false, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width * 0.2
        var buttonIndex:CGFloat = 0
        
        plusButton.sizeToFit()
        plusButton.center = CGPoint(x: self.center.x,y: self.frame.height * 0.5)
        
        for item in subviews {
            if item.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                item.frame = CGRect(x: width * (buttonIndex > 1 ? buttonIndex + 1 : buttonIndex), y: 0, width: width, height: item.frame.height)
                
                buttonIndex++
            }
        }
    }

}
