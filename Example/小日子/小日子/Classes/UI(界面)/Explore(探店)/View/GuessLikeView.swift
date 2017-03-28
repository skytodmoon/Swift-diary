//
//  GuessLikeView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GuessLikeView: UIView {

    
    class func guessLikeViewFromXib() -> GuessLikeView {
        let guessLike = NSBundle.mainBundle().loadNibNamed("GuessLikeView", owner: nil, options: nil).last as! GuessLikeView
        return guessLike
    }

}
