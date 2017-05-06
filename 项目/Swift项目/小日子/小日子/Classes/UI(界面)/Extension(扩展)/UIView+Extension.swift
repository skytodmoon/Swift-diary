//
//  UIView+Extension.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation

/**
 * 这是UIView的扩展
 */
extension UIView {

    var x : CGFloat {
        return self.frame.origin.x
    }
    
    var y : CGFloat {
        return self.frame.origin.y
    }
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    
    var size: CGSize {
        return self.frame.size
    }
    
    var potin: CGPoint {
        return self.frame.origin
    }
}
