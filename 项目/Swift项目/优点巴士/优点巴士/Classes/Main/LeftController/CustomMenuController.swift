//
//  DrawerMenuExplain.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import QuartzCore
//自定义 侧滑
//
class CustomMenuController: DrawerMenuController {

    //
    override func layoutCurrentViewWithOffset(_ xoffset: CGFloat) {
        super.layoutCurrentViewWithOffset(xoffset)
        if xoffset > 0 {
        leftSideView!.frame = CGRect( x: ( -leftSideView!.frame.size.width + xoffset +  xoffset / self.leftViewShowWidth * ( leftSideView!.frame.size.width - xoffset) ) , y: 0, width: leftSideView!.frame.size.width, height: leftSideView!.frame.size.height)
            leftSideView!.alpha = xoffset/self.leftViewShowWidth
        }
    }
  
    override func showLeftViewController(_ animated: Bool) {
        
        super.showLeftViewController(true)
 
    }
    
    override func showRightViewController(_ animated: Bool) {
        super.showRightViewController(true)
    }
    
    override func hideSideViewController(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3, animations: {
            var newFrame:CGRect =  self.mainContentView!.frame
            if newFrame.origin.x < 0 {
                newFrame.origin.x  =  newFrame.origin.x - 30
            }else {
                newFrame.origin.x  =  newFrame.origin.x + 30
            }
            
            self.mainContentView!.frame = newFrame
            }, completion: {
                (finish:Bool) -> Void in
                self.close()
            })

        
        //super.hideSideViewController(true)
    
    }
 
    func close(){
        super.hideSideViewController(true)
    }
    
    
    
    
    
}
