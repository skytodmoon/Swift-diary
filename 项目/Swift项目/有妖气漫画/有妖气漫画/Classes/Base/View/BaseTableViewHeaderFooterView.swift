//
//  BaseTableViewHeaderFooterView.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Reusable

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView,Reusable {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}

}
