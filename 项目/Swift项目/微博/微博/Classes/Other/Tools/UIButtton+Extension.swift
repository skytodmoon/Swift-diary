//
//  UIButtton+Extension.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIButton {
    
    //MARK: - 快速创建按钮
    class func createButton(imageNamed: String, title: String) ->UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageNamed), for: UIControlState.normal)
        btn.setTitle(title, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), for: UIControlState.normal)
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return btn
    }
}
