//
//  BaseCollectionReusableView.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/19.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Reusable

class BaseCollectionReusableView: UICollectionReusableView, Reusable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}

