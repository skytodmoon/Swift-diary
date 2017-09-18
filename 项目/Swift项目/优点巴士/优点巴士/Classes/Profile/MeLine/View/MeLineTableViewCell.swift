//
//  MeLineTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeLineTableViewCell: UITableViewCell {
    
    var melinemodel : MeLineModel? {
        didSet {
            // 校验模型是否有值
//            guard let Melinemodel = melinemodel else { return }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
