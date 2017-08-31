//
//  Animater.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class Animater: NSObject,UIViewControllerAnimatedTransitioning {
    
    private var toView:UIView?
    private var transitionContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        self.transitionContext = transitionContext
        return 1.0
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        let fromController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        let fromView = fromController?.view
        let toView = toController?.view
        
        self.toView = toView
        containerView.addSubview(toView!)
        toView?.frame = fromView!.frame
        let path = UIBezierPath.init(rect: CGRect(x: toView!.centerX - 20, y: toView!.centerY - 20, width:100 , height: 40))
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath.init(rect: toView!.frame).cgPath
        let animation = CABasicAnimation.init(keyPath: "path")
        animation.delegate = self as? CAAnimationDelegate
        animation.duration = transitionDuration(using: transitionContext)
        animation.fromValue = path.cgPath
        animation.toValue = UIBezierPath.init(rect: toView!.frame).cgPath
        maskLayer.add(animation, forKey: "mask")
        toView?.layer.mask = maskLayer
        
    }
    
    func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(true)
        toView?.layer.mask = nil
        
    }
}
