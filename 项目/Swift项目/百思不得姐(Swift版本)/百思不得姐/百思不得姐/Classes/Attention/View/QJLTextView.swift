//
//  QJLTextView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class QJLTextView: UITextField {

    override func becomeFirstResponder() -> Bool {
        
        /*  点击的时候 改变placeholder 为白色  */
        let attrs = [NSForegroundColorAttributeName:textColor as! AnyObject]
        let placeholder = NSAttributedString.init(string: self.placeholder!, attributes: attrs)
        attributedPlaceholder = placeholder
        
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        /*  退出的时候为灰色  */
        let attrs = [NSForegroundColorAttributeName:UIColor.grayColor() as AnyObject]
        let placeholder = NSAttributedString.init(string: self.placeholder!, attributes: attrs)
        attributedPlaceholder = placeholder
        
        return super.resignFirstResponder()
    }

}
