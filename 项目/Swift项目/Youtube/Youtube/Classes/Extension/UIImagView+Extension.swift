//
//  UIImagView+Extension.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

let imageCache = NSCache()

class CustomImageView:UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
            let url = NSURL(string: urlString)
            imageUrlString = urlString
            image = nil
        
        if let imageFromCache = imageCache.objectForKey(urlString) as? UIImage {
            self.image = imageFromCache
            return
        }
        
            NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    let imageToCache = UIImage(data: data!)
                    
                    if self.imageUrlString == urlString {

                        self.image = imageToCache
                    }
                        imageCache.setObject(imageToCache!, forKey: urlString)
                })
                
            }).resume()
        }
    }
