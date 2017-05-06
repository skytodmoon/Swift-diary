//
//  CustomAnnotationView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CustomAnnotationView: MAAnnotationView {
    
    var calloutView: CustomCalloutView?
    
    override func setSelected(selected: Bool, animated: Bool) {
        calloutView = CustomCalloutView(frame: CGRect(x: 0, y: 0, width: AppWidth - 50, height: 60))
        calloutView!.center = CGPointMake(CGRectGetWidth(self.bounds) * 0.5 + calloutOffset.x,
                                          -CGRectGetHeight(calloutView!.bounds) * 0.5 + calloutOffset.y)
        addSubview(calloutView!)
    }

}
