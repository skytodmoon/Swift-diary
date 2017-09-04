//
//  PublishController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class PublishController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var slogsanView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        /*点击加号按钮设置*/
        self.view.isUserInteractionEnabled = false
        self.containerView.transform = CGAffineTransform(translationX: 0, y: -500)
        self.slogsanView.transform = CGAffineTransform(translationX: 200, y: -200)
        // Do any additional setup after loading the view.
    }

    /*点击加号弹出动画时间*/
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
        UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: 0.7,
                                   initialSpringVelocity: 10,
                                   options: .curveEaseInOut,
                                   animations: { () -> Void in
                                    self.containerView.transform = CGAffineTransform.identity
                                    self.slogsanView.transform = CGAffineTransform.identity
                                    
        }) { (bool:Bool) -> Void in
            self.view.isUserInteractionEnabled = true
        }
    }
    /*点击取消按钮设置动画消失*/
    @IBAction func cancel() {
        
        self.view.isUserInteractionEnabled = false
        
        self.containerView.transform = CGAffineTransform.identity
        self.slogsanView.transform = CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.containerView.transform = CGAffineTransform(translationX: 0, y: 500)
            self.slogsanView.transform = CGAffineTransform(translationX: 0, y: 700)
        }) { (bool:Bool) -> Void in
            self.dismiss(animated: false, completion: nil)
        }
    }


}
