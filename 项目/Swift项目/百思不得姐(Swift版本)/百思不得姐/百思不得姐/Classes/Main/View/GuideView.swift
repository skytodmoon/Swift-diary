//
//  GuideView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GuideView: UIView {
    
    @IBAction func hide(sender: AnyObject) {
        removeFromSuperview()
    }
    class func show() {
        
        let key = "CFBundleVersion"

        let currentVersion = NSBundle.mainBundle().infoDictionary![key]?.integerValue
        let lastVersion = NSUserDefaults.standardUserDefaults().integerForKey(key)
        if currentVersion != lastVersion {
            let window = UIApplication.sharedApplication().keyWindow
            let view = NSBundle.mainBundle().loadNibNamed("GuideView", owner: self, options: nil)[0] as! UIView
            
            view.frame = window!.bounds
            window?.addSubview(view)
            
            NSUserDefaults.standardUserDefaults().setInteger(currentVersion!, forKey: key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
