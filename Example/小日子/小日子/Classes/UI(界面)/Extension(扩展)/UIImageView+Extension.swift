//
//  UIImageView+Extension.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /**
     *设置网络图片的扩展
     */
    func wxn_setImageWithURL(url: NSURL, placeholderImage: UIImage)  {
        self.sd_setImageWithURL(url,placeholderImage: placeholderImage)
    }
}
