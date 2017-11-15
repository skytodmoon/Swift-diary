//
//  MoreViewController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    let zoomImageView = UIImageView()
    let startingFrame = CGRectMake(0, 0, 200, 100)

    override func viewDidLoad() {
        super.viewDidLoad()

        zoomImageView.userInteractionEnabled = true
        zoomImageView.frame = startingFrame
        zoomImageView.backgroundColor = UIColor.redColor()
        zoomImageView.image = UIImage(named: "You name")
        zoomImageView.contentMode = .ScaleAspectFill
        zoomImageView.clipsToBounds = true
        zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(MoreViewController.animate)))
        // Do any additional setup after loading the view.
        view.addSubview(zoomImageView)
    }

    func animate() {
        UIView.animateWithDuration(0.75) {()-> Void in
            let height = (self.view.frame.width / self.startingFrame.width) * self.startingFrame.height
            let y = self.view.frame.height / 2 - height / 2
            self.zoomImageView.frame = CGRectMake(0, y, self.view.frame.width, height)
        }
    }

}
