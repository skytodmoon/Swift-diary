//
//  MessageViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //MARK: - 判断用户是否登录
//        if !userIsLogin{
//            visitorView.setupVisitorInfo(isHome: false, imageName: "visitordiscover_image_message", message: "我是醉看红尘这场梦,这是我仿写的新浪微博客户端")
//        }
        setNav()

        // Do any additional setup after loading the view.
    }
    
    func setNav() {
        
        navigationItem.title = "我的关注"
        
        navigationItem.leftBarButtonItem = Common.itemWithImage(image: UIImage.init(named: "friendsRecommentIcon")!, highlightImage: UIImage.init(named: "friendsRecommentIcon-click")!, target: self, action: #selector(MessageViewController.pushToRecommend))
        
        view.backgroundColor = QJLBgColor
    }
    
    @IBAction func login() {
        /* 点击登录按钮设置UIViewControllerAnimatedTransitioning动画 */
        let oauthVC = OAuthViewController()
        oauthVC.transitioningDelegate = self as UIViewControllerTransitioningDelegate
        present(oauthVC, animated: true, completion: nil)
    }
    
    func pushToRecommend() {
        self.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(RecommendController(), animated: true)
        self.hidesBottomBarWhenPushed = false

    }
}

extension MessageViewController :UIViewControllerTransitioningDelegate{
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return Animater()
    }
}
