//
//  LoadAnimatImageView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class LoadAnimatImageView: NSObject {
    
    private static let sharedInstance = LoadAnimatImageView()
    class var sharedManager : LoadAnimatImageView {
        return sharedInstance
    }
    
    private lazy var loadImageView: UIImageView! = {
        let loadImageView = UIImageView()
        loadImageView.animationImages = self.loadAnimImages!
        loadImageView.animationRepeatCount = 10000
        loadImageView.animationDuration = 1.0
        loadImageView.frame = CGRectMake(0, 0, 44, 51)
        return loadImageView
    }()
    
    private lazy var loadAnimImages: [UIImage]? = {
        var images = [UIImage]()
        for i in 0...92 {
            let image = UIImage(named: String(format: "wnx%02d", i))
            images.append(image!)
        }
        
        return images
    }()
    
    func startLoadAnimatImageViewInView(view: UIView, center: CGPoint)  {
        
        loadImageView.center = center
        view.addSubview(loadImageView)
        loadImageView.startAnimating()
    }
    
    func stopLoadAnimatImageView() {
        loadImageView.removeFromSuperview()
        loadImageView.stopAnimating()
    }


}
