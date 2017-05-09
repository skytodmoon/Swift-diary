//
//  PopoverPresentationController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.width

class PopoverPresentationController: UIPresentationController {
    
    var presentFrame = CGRectZero
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController:presentingViewController)
    }
    override func containerViewWillLayoutSubviews() {
        containerView?.insertSubview(coverView, atIndex: 0)
        coverView.frame = (containerView?.frame)!
        if presentFrame == CGRectZero{
            presentedView()?.frame = CGRect(x:(screenWidth-200)/2.0 , y: 56, width: 200, height: 200)
        }else
        {
            presentedView()?.frame = presentFrame
        }
    }
    //MARK: 蒙版
    private lazy var coverView: UIView = {
        let view = UIView()
        view.frame = UIScreen.mainScreen().bounds
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopoverPresentationController.close))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func close(){
        presentedViewController.dismissViewControllerAnimated(true, completion: nil);
        
    }
}
