//
//  UIImageView+Extension.swift
//  小黄车(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIImageView {
    // 播放GIF
    func playGifAnimation(images: [UIImage]) {
        guard images == images else {  return }
        self.animationImages = images   //动画图片数组
        self.animationDuration = 0.8    //执行一次完整动画所需的时长
        self.animationRepeatCount = 0   //动画重复次数, 设置成0 就是无限循环
        self.startAnimating()           // 开始动画
        
    }
    
    // 停止动画
    func stopGifAnimation() {
        if self.isAnimating {           // 动画是否正在执行
            self.stopAnimating()        // 停止动画
        }
        self.removeFromSuperview()      // 从父控件中移除
    }
}
