//
//  UIView+Extension.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

/// 对UIView的扩展
extension UIView
{
    /// X值
    var x: CGFloat {
        return self.frame.origin.x
    }
    
    /// Y值
    var y: CGFloat {
        return self.frame.origin.y
    }
    
    /// 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    
    /// 高度
    var height: CGFloat {
        return self.frame.size.height
    }
    
    /// 尺寸
    var size: CGSize {
        return self.frame.size
    }
    
    /// 坐标
    var point: CGPoint {
        return self.frame.origin
    }
}
