//
//  UIView+Extension.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

extension UIView {
    
    public func isShowingOnKeyWindow() -> Bool {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return false
        }
        
        // 以主窗口的左上角为原点，计算self的矩形框
        let newFrame = keyWindow.convert(self.frame, from: self.superview)
        let windowBounds = keyWindow.bounds
        
        // 主窗口的bounds和self的矩形框是否有重叠
        let isIntersects = newFrame.intersects(windowBounds)
        
        return isIntersects && (self.isHidden == false) && (self.alpha > 0.01) && (self.window == keyWindow)
    }
    
}
