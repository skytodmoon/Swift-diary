//
//  UIView+Extension.swift
//  爱鲜蜂(Swift)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

//MARK: - 对UIView的扩展
extension UIView {
    //MARK: - X值
    var x: CGFloat {
        return self.frame.origin.x
    }
    //MARK: - Y值
    var y: CGFloat {
        return self.frame.origin.y
    }
    //MARK: - 宽度
    var width: CGFloat {
        return self.frame.size.width
    }
    //MARK: - 高度
    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}
