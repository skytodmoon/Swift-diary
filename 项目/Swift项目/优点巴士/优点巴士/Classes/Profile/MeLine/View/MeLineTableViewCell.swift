//
//  MeLineTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeLineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var lineNo: UILabel!
    @IBOutlet weak var startStationName: UILabel!
    @IBOutlet weak var endStationName: UILabel!
    @IBOutlet weak var melineview: UIView!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var runTimes: UILabel!
    @IBOutlet weak var dayPrice: UILabel!
    
    var melinemodel : MeLineModel? {
        didSet {
            // 校验模型是否有值
            guard let PaidLineList = melinemodel else { return }
            lineLabel.text = PaidLineList.lineLabel
            lineNo.text = PaidLineList.lineNo
            
            let str1="("
            let str2 = PaidLineList.startStationName
            let str3 = str1+str2!
            startStationName.text = str3
            
            let str4 = PaidLineList.endStationName
            let str5 = ")"
            let str6 = str4! + str5
            endStationName.text = str6
            
            
            
            let str = PaidLineList.startTime
            //截取时间段字符串
            let startIndex = str?.index((str?.startIndex)!, offsetBy:10)
            let endIndex = str?.index(startIndex!, offsetBy:6)
            let result = str?.substring(with: startIndex!..<endIndex!)
            
            startTime.text = result
            
            
            
            let str11 = melinemodel?.mileage
            let str12 = "公里"
            let str13 = str11!+str12
            mileage.text = str13
            
            
            let str14 = "约"
            let str15 = melinemodel?.runTimes
            let str16 = "分钟"
            let str17 = str14+str15!+str16
            runTimes.text = str17
            
            let str7 = "¥"
            let str8 = melinemodel?.dayPrice
            let str9 = "购票"
            let str10 = str7+str8!+str9
            dayPrice.text = str10

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        melineview.layer.cornerRadius = 3
        melineview.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
