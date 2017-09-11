//
//  MeOderTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeOderTableViewCell: UITableViewCell {
    
    @IBOutlet var lineLabel: UILabel!

    @IBOutlet var lineNo: UILabel!
    
    @IBOutlet var startStationName: UILabel!
    
    @IBOutlet var endStationName: UILabel!
    
    @IBOutlet var createDate: UILabel!
    
    @IBOutlet var realPrice: UILabel!
    
    @IBOutlet var startTime: UILabel!
    
    
    
    var meodermodel : MeOderModel? {
        didSet {
            // 校验模型是否有值
            guard let meodermodel = meodermodel else { return }
            lineNo.text = meodermodel.lineNo
            
            let str1="("
            let str2 = meodermodel.startStationName
            let str3 = str1+str2!
            startStationName.text = str3
            
            let str4 = meodermodel.endStationName
            let str5 = ")"
            let str6 = str4! + str5
            endStationName.text = str6
            
            lineLabel.layer.cornerRadius = 3
            lineLabel.layer.masksToBounds = true
            lineLabel.text = meodermodel.lineLabel
            
            createDate.text = meodermodel.createDate
            realPrice.text = meodermodel.realPrice
            
            startTime.text = meodermodel.startTime
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
