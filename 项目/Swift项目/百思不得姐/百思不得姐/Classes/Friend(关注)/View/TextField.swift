//
//  TextField.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class TextField: UITextField {


    let PlaceholderLabelKey = "_placeholderLabel.textColor"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var count:UInt32 = 0
        
        let vars = class_copyIvarList(UITextField.self, &count)
        
        for i in 0..<count {
            let ivar = vars![Int(i)]
            print("\(String(describing: ivar_getName(ivar)))")
        }
        
        tintColor = textColor
        _ = resignFirstResponder()
    }
    
    override func becomeFirstResponder() -> Bool {
        self.setValue(textColor, forKeyPath: PlaceholderLabelKey)
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        self.setValue(UIColor.gray, forKeyPath: PlaceholderLabelKey)
        return super.resignFirstResponder()
    }

}
