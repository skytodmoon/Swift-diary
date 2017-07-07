//
//  AttentionController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class AttentionController: UIViewController {
    
    override func viewDidLoad() {
        
        setNav()
       
    }
    
    func setNav() {
        
        navigationItem.title = "我的关注"
        
        navigationItem.leftBarButtonItem = Common.itemWithImage(UIImage.init(named: "friendsRecommentIcon")!, highlightImage: UIImage.init(named: "friendsRecommentIcon-click")!, target: self, action: #selector(AttentionController.pushToRecommend))
        
        view.backgroundColor = QJLBgColor
    }
    
    @IBAction func login() {
        /* 点击登录按钮设置UIViewControllerAnimatedTransitioning动画 */
        let loginVC = LoginController()
        loginVC.transitioningDelegate = self
        presentViewController(loginVC, animated: true, completion: nil)
    }
    
    func pushToRecommend() {
        navigationController?.pushViewController(RecommendController(), animated: true)
    }
}

extension AttentionController :UIViewControllerTransitioningDelegate{
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return Animater()
    }
}
