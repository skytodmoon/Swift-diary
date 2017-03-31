//
//  ProgressHUD.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProgressHUD: NSObject {
    
    class func setupHUD() {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
        SVProgressHUD.setBackgroundColor(UIColor(white: 0.0, alpha: 0.8))
        SVProgressHUD.setFont(UIFont.boldSystemFontOfSize(16))
        SVProgressHUD.setMinimumDismissTimeInterval(2.0)
        
    }
    
    class func show() {
        SVProgressHUD.show()
    }
    
    class func showWithStatus(status: String) {
        SVProgressHUD.showWithStatus(status)
    }
    
    class func showInfoWithStatus(status: String) {
        SVProgressHUD.showInfoWithStatus(status)
    }
    
    class func showSuccessWithStatus(status: String) {
        SVProgressHUD.showSuccessWithStatus(status)
    }
    
    class func showErrorWithStatus(status: String) {
        SVProgressHUD.showErrorWithStatus(status)
    }
    
    class func dismiss() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            SVProgressHUD.dismiss()
        }
    }


}
