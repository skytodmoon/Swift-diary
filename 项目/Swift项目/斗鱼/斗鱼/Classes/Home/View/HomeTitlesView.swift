//
//  HomeTitlesView.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kScrollLineH: CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)


// MARK:- 定义协议
@objc
protocol HomeTitlesViewDelegate: NSObjectProtocol {
    @objc optional func HomeTitlesViewDidSetlected(_ homeTitlesView: HomeTitlesView, selectedIndex: Int)
}


class HomeTitlesView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
