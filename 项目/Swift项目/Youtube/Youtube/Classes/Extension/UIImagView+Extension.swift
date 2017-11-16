//
//  UIImagView+Extension.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
            let url = NSURL(string: urlString)
            NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(),{
                    self.image = UIImage(data: data!)
                })
                
            }).resume()
        }
    }
