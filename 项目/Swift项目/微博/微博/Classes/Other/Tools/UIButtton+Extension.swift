//
//  UIButtton+Extension.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIButton {
    
    //MARK: - 快速创建按钮
    class func createButton(imageNamed: String, title: String) ->UIButton {
            let btn = UIButton()
            btn.setImage(UIImage(named: imageNamed), forState: UIControlState.Normal)
            btn.setTitle(title, forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(10)
            btn.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return btn
    }
}