//
//  UIViewController+Extension.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SWRevealViewController


// MARK: - 侧滑相关控制器
extension UIViewController {
    func getRevealViewController() -> SWRevealViewController {
        var parent: UIViewController? = self
        // let revealClass: AnyClass = SWRevealViewController.classForCoder()
        while (nil != (parent = parent?.parent) && !(parent is SWRevealViewController)) {
            
        }
        return (parent as! SWRevealViewController)
    }
}

