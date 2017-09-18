//
//  ActivityDetailTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ActivityDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startStationName: UILabel!
    
    @IBOutlet var endStationName: UILabel!
    
    @IBOutlet var dayPrice: UILabel!
    
    @IBOutlet var date: UILabel!
    
    var activitDetailmodel : ActivityDetailModel? {
        didSet {
            // 校验模型是否有值
            guard let activitDetail = activitDetailmodel else { return }
            startStationName.text = activitDetail.startStationName
            endStationName.text = activitDetail.endStationName
            
          let str1="¥"
          let str2 = activitDetail.dayPrice
          let str3 = str1+str2!
          dayPrice.text = str3
            
            date.text = activitDetail.startTime
            
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
