//
//  Common.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


let screenW = UIScreen.main.bounds.width
/* 屏幕高度 */
let screenH = UIScreen.main.bounds.height


extension UIView{
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    
    var centerX:CGFloat{
        get{
            return self.frame.midX
        }
        set{
            self.frame.origin.x = newValue - self.frame.size.width * 0.5
        }
    }
    
    var centerY:CGFloat{
        get{
            return self.frame.midY
        }
        set{
            self.frame.origin.y = newValue - self.frame.size.height * 0.5
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    
    var size:CGSize{
        get{
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    func isShowingOnKeyWindow() -> Bool{
        let window = UIApplication.shared.keyWindow
        
        let newFrame = self.superview!.convert(self.frame, to: window)
        let intersects = newFrame.intersects((window?.frame)!)
        
        return !self.isHidden && self.alpha > 0.01 && intersects
    }
    
}

class Common:NSObject{
    /**创建一个barButtonItem*/
    class func itemWithImage(image:UIImage,highlightImage:UIImage,target:UIViewController,action:Selector) -> UIBarButtonItem{
        
        let button = UIButton.init()
        
        button.setBackgroundImage(image, for: .normal)
        button.setBackgroundImage(highlightImage, for: .highlighted)
        
        button.sizeToFit()
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem.init(customView: button)
        
    }
}
