//
//  ChatContentViewCell.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ChatContentViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}
