//
//  PlaceHolderTextView.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class PlaceHolderTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        layer.cornerRadius = 2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // 添加占位
        addSubview(placeHolderLabel)
        placeHolderLabel.snp_makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(8)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // placeHolder
    lazy var placeHolderLabel : UILabel = UILabel(textColor: UIColor.lightGrayColor(), font: UIFont.systemFontOfSize(12))


}
