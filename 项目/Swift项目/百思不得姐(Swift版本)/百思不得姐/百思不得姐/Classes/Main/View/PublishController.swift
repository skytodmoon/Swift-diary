//
//  PublishController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class PublishController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var slogsanView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*点击加号按钮设置*/
        self.view.userInteractionEnabled = false
        self.containerView.transform = CGAffineTransformMakeTranslation(0, -500)
        self.slogsanView.transform = CGAffineTransformMakeTranslation(200, -200)
        
    }
    /*点击加号弹出动画时间*/
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 0.7,
                                   initialSpringVelocity: 10,
                                   options: .CurveEaseInOut,
                                   animations: { () -> Void in
                                    self.containerView.transform = CGAffineTransformIdentity
                                    self.slogsanView.transform = CGAffineTransformIdentity
                                    
        }) { (bool:Bool) -> Void in
            self.view.userInteractionEnabled = true
        }
    }
    /*点击取消按钮设置动画消失*/
    @IBAction func cancel() {
        
        self.view.userInteractionEnabled = false
        
        self.containerView.transform = CGAffineTransformIdentity
        self.slogsanView.transform = CGAffineTransformIdentity
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.containerView.transform = CGAffineTransformMakeTranslation(0, 500)
            self.slogsanView.transform = CGAffineTransformMakeTranslation(0, 700)
        }) { (bool:Bool) -> Void in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }

}
