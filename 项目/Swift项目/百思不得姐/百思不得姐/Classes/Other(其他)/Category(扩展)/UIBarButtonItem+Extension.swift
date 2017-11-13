//
//  UIBarButtonItem+Extension.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/10.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(image: String, highImage: String, targat:Any, action: Selector)  {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named:image), for: .normal)
        button.setBackgroundImage(UIImage(named:highImage), for: .highlighted)
        button.addTarget(targat, action: action, for: .touchUpInside)
        button.sizeToFit()
        self.init(customView: button)
    }
    
}

