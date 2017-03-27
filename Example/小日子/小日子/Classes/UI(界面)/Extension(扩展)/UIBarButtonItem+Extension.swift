//
//  UIBarButtonItem+Extension.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation

/**
 *  扩展UIBarButtonItem
 */

extension UIBarButtonItem {
    /**
     *  针对导航条右边按钮的自定义item
     */
    convenience init(imageName: String, highlImageName: String, targer: AnyObject, action: Selector) {
        let button: UIButton = UIButton(type: .Custom)
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.setImage(UIImage(named: highlImageName), forState: .Highlighted)
        button.frame = CGRectMake(0, 0, 50, 44)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.addTarget(targer, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: button)
    }
    
    /**
     *  针对导航条右边按钮选中状态的自定义item
     */
    convenience init(imageName: String, highlImageName: String, selectedImage: String, targer: AnyObject, action: Selector) {
        let button: UIButton = UIButton(type: .Custom)
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.setImage(UIImage(named: highlImageName), forState: .Highlighted)
        button.frame = CGRectMake(0, 0, 50, 44)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10)
        button.setImage(UIImage(named: selectedImage), forState: .Selected)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.addTarget(targer, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: button)
    }
    /**
     *  针对导航条左边按钮自定义的item
     */
    
    convenience init(leftimageName: String, highlImageName: String, targer: AnyObject, action: Selector) {
        let button: UIButton = UIButton(type: .Custom)
        button.setImage(UIImage(named: leftimageName), forState: .Normal)
        button.setImage(UIImage(named: highlImageName), forState: .Highlighted)
        button.frame = CGRectMake(0, 0, 80, 44)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.addTarget(targer, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: button)
    }
    
    /**
     *  导航条纯文字按钮
     */
    
    convenience init(title: String, titleClocr: UIColor, targer: AnyObject, action: Selector) {
        let button: UIButton = UIButton(type: .Custom)
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(titleClocr, forState: .Normal)
        button.titleLabel?.font = theme.SDNavTitleFont
        button.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        button.frame = CGRectMake(0, 0, 80, 44)
        button.titleLabel?.textAlignment = NSTextAlignment.Right
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5)
        button.addTarget(targer, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: button)
    }
    
}
