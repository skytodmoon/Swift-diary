//
//  Kingfisher+Extension.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/26.
//  Copyright © 2017年 金亮齐. All rights reserved.
//
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(_ URLString : String?, _ placeHolderName : UIImage? = nil, _ isAvatar: Bool = false) {
        
        guard let URLString = URLString, let url = URL(string: URLString) else {
            // 设置占位图像
            image = placeHolderName
            return
        }
        
        
        kf.setImage(with: url, placeholder: placeHolderName, options: [], progressBlock: nil) {[weak self] (image, _, _, _) in
            
            if isAvatar {
                self?.image = image?.xj_avatarImage(size: self?.bounds.size)
            }
        }
    }
}

