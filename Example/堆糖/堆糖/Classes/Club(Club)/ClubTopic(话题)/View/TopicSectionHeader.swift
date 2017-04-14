//
//  TopicSectionHeader.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TopicSectionHeader: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    class func loadFromXib() -> TopicSectionHeader {
        
        return   NSBundle.mainBundle().loadNibNamed("TopicSectionHeader", owner: self, options: nil).last as! TopicSectionHeader
    }

}
