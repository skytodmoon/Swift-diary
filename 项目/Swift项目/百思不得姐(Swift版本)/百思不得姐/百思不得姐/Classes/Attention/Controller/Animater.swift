//
//  Animater.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class Animater: NSObject,UIViewControllerAnimatedTransitioning {
    
    private var toView:UIView?
    private var transitionContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        self.transitionContext = transitionContext
        return 1.0
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        
        let fromController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()
        let fromView = fromController?.view
        let toView = toController?.view
        
        self.toView = toView
        containerView?.addSubview(toView!)
        toView?.frame = fromView!.frame
        let path = UIBezierPath.init(rect: CGRect(x: toView!.centerX - 20, y: toView!.centerY - 20, width:100 , height: 40))
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath.init(rect: toView!.frame).CGPath
        let animation = CABasicAnimation.init(keyPath: "path")
        animation.delegate = self
        animation.duration = transitionDuration(transitionContext)
        animation.fromValue = path.CGPath
        animation.toValue = UIBezierPath.init(rect: toView!.frame).CGPath
        maskLayer.addAnimation(animation, forKey: "mask")
        toView?.layer.mask = maskLayer
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(true)
        toView?.layer.mask = nil
        
    }
}
