//
//  AnimationTabBarController.swift
//  爱鲜蜂(Swift)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


class RAMBounceAnimation : RAMItemAnimation {
    
    override func playAnimation(icon : UIImageView, textLabel : UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }
    
    override func deselectAnimation(icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor) {
        textLabel.textColor = defaultTextColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = defaultTextColor
            
        }
    }
    
    override func selectedState(icon : UIImageView, textLabel : UILabel) {
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    
    func playBounceAnimation(icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = NSTimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.addAnimation(bounceAnimation, forKey: "bounceAnimation")
        
        if let iconImage = icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
}


class RAMAnimatedTabBarItem: UITabBarItem {
    
    var animation: RAMItemAnimation?
    
    var textColor = UIColor.grayColor()
    
    func playAnimation(icon: UIImageView, textLabel: UILabel){
        guard let animation = animation else {
            print("add animation in UITabBarItem")
            return
        }
        animation.playAnimation(icon, textLabel: textLabel)
    }
    
    func deselectAnimation(icon: UIImageView, textLabel: UILabel) {
        animation?.deselectAnimation(icon, textLabel: textLabel, defaultTextColor: textColor)
    }
    
    func selectedState(icon: UIImageView, textLabel: UILabel) {
        animation?.selectedState(icon, textLabel: textLabel)
    }
}

protocol RAMItemAnimationProtocol {
    
    func playAnimation(icon : UIImageView, textLabel : UILabel)
    func deselectAnimation(icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor)
    func selectedState(icon : UIImageView, textLabel : UILabel)
}

class RAMItemAnimation: NSObject, RAMItemAnimationProtocol {
    
    var duration : CGFloat = 0.6
    var textSelectedColor: UIColor = UIColor.grayColor()
    var iconSelectedColor: UIColor?
    
    func playAnimation(icon : UIImageView, textLabel : UILabel) {
    }
    
    func deselectAnimation(icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor) {
        
    }
    func selectedState(icon: UIImageView, textLabel : UILabel) {
    }
    
}

class AnimationTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
