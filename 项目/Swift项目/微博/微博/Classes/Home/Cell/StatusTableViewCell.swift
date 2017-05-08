//
//  StatusTableViewCell.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

enum StatusTableViewCellIdentifier: String {
    case NormalCell  = "NormalCell"
    case ForwardCell = "ForwardCell"
//    static func cellID(status: Status) -> String{
//    }
}

class StatusTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
