//
//  TabBar.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/10.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    private let kTabBarHeight: CGFloat = 49
    override init(frame: CGRect) {
        super.init(frame: frame)
        publishButton.addTarget(self, action: #selector(clickPublishButton), for: .touchUpInside)
        addSubview(publishButton)
    }
    
    @objc private func clickPublishButton() {
        
        
        let publishVC = PublishViewController()
        
        UIApplication.shared.keyWindow?.rootViewController?.present(publishVC, animated: false, completion: nil)
        
    }
    
    override func layoutSubviews() {
        
        // 调用父类的方法
        super.layoutSubviews()
        // 重新修改frame
        var currentFrame = frame
        if currentFrame.height > kTabBarHeight {
            currentFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: kTabBarHeight)
        }
        // 加号
        publishButton.center = CGPoint(x: currentFrame.width/2, y: currentFrame.height/2)
        
        // button
        let buttonW = currentFrame.width/5
        let buttonH = currentFrame.height
        let buttonY: CGFloat = 0
        var index: CGFloat = 0
        for view in subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                
                let buttonX = (index < 2) ? index * buttonW : (index + 1) * buttonW
                view.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
                index += 1
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var publishButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage.init(named: "tabBar_publish_icon"), for: .normal)
        button.setBackgroundImage(UIImage.init(named: "tabBar_publish_click_icon"), for: .highlighted)
        button.frame = CGRect(x: 100, y: 0, width: button.currentBackgroundImage?.size.width ?? 40, height: button.currentBackgroundImage?.size.height ?? 40)
        return button
    }()
}
