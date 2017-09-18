//
//  ActivityTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    
    @IBOutlet var datalabel: UILabel!
    
    @IBOutlet var commuteAmountlabel: UILabel!
    
    @IBOutlet var ALLAmountlabel: UILabel!
    
    @IBOutlet var intercityAmountlabel: UILabel!
    
    @IBOutlet var qualityAmountlabel: UILabel!
    
    var activitmodel : ActivityModel? {
        didSet {
            // 校验模型是否有值
            guard let activit = activitmodel else { return }
            datalabel.text = activit.date
            commuteAmountlabel.text = String.init(format: "%.2f", activit.commuteAmount)
            ALLAmountlabel.text = String.init(format: "%.2f", activit.ALLAmount)
            intercityAmountlabel.text = String.init(format: "%.2f", activit.intercityAmount)
            qualityAmountlabel.text = String.init(format: "%.2f", activit.qualityAmount)
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
