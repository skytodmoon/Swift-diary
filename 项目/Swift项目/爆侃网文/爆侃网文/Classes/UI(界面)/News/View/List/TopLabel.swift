//
//  TopLabel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TopLabel: UILabel {

    var scale : Float? {
        didSet {
            // 通过scale的改变来改变各种参数
            textColor = UIColor(colorLiteralRed: scale! + 245, green: 245.0, blue: 245.0, alpha: 0.85)
            let minScale : Float = 0.9
            let trueScale = minScale + (1 - minScale) * Float(scale!)
            transform = CGAffineTransformMakeScale(CGFloat(trueScale), CGFloat(trueScale))
        }
    }
    
    // MARK: - 构造函数
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = NSTextAlignment.Center
        font = UIFont.systemFontOfSize(20.0)
    }
    

}
