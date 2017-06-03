//
//  UIAlertView+Extension.swift
//  小黄车(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

var dismissBlock: ((_ buttonIndex: NSInteger)->())?
var cancelBlock: (()->())?

extension UIAlertView: UIAlertViewDelegate {
    convenience init(title: String,message: String,cancleTitle: String,otherButtonTitle: [String], onDismissBlock:@escaping ((_ buttonIndex: NSInteger)->()),onCancleBlock: @escaping (()->())){
        self.init(title: title, message: message, delegate: nil, cancelButtonTitle: cancleTitle)
        self.delegate = self
        dismissBlock = onDismissBlock
        cancelBlock = onCancleBlock
        for buttonTitle in otherButtonTitle {
            self.addButton(withTitle: buttonTitle)
        }
        self.show()
    }
    
    public func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            if ((cancelBlock) != nil) {
                cancelBlock!()
            }
        } else{
            if ((dismissBlock) != nil) {
                dismissBlock!(buttonIndex);
            }
        }
    }
}
