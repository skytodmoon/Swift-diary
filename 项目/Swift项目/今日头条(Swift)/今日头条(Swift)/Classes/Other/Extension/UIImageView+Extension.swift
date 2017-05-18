//
//  UIImageView+Extension.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setCircleHeader(url: String){
        let placeholder = UIImage(named: "home_head_default_29x29_")
        self.kf_setImageWithURL(NSURL(string: url)!)
        self.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: placeholder, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            self.image = (image == nil) ? placeholder : image?.circleImage()
        }
    }
}
