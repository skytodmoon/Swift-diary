//
//  UIImageView+Extension.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

extension UIImageView {
    
    public func setHeaderImage(_ imagerUrl: String) {
        if let url = URL(string: imagerUrl){
            kf.setImage(with: url, placeholder: UIImage(named:"defaultUserIcon"), options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                if error != nil {
                    return
                }
                self.image = image?.cicleImage()
            })
        }
    }
}

