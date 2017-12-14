//
//  UIScrollView+ParallaxHeader.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import ObjectiveC.runtime


/**
 A UIScrollView extension with a ParallaxHeader.
 */
extension UIScrollView {
    
    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.parallaxHeader"
    }
    
    /**
     The parallax header.
     */
    public var parallaxHeader: ParallaxHeader {
        get {
            if let header = objc_getAssociatedObject(
                self,
                &AssociatedKeys.descriptiveName
                ) as? ParallaxHeader {
                return header
            }
            let header = ParallaxHeader()
            self.parallaxHeader = header
            return header
        }
        set(parallaxHeader) {
            parallaxHeader.scrollView = self
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.descriptiveName,
                parallaxHeader,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}
