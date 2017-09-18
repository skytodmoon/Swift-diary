//
//  BusTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class BusTableViewCell: UITableViewCell {
    
    
    @IBOutlet var busView: UIView!
    
    @IBOutlet var lineLabel: UILabel!
    
    @IBOutlet var lineNo: UILabel!
    
    @IBOutlet var startStationName: UILabel!
    
    @IBOutlet var endStationName: UILabel!
    
    @IBOutlet var dayPrice: UILabel!
    
    @IBOutlet var mileage: UILabel!
    
    @IBOutlet var runTimes: UILabel!
    
    @IBOutlet var startTime: UILabel!
    
    
    var busmodel : BusModel? {
        didSet {
            // 校验模型是否有值
            guard let Busmodel = busmodel else { return }
            
            busView.layer.cornerRadius = 3
            busView.layer.masksToBounds = true
            
            lineLabel.layer.cornerRadius = 3
            lineLabel.layer.masksToBounds = true
            lineLabel.text = Busmodel.lineLabel
            
            lineNo.text = Busmodel.lineNo
            
            let str1="("
            let str2 = Busmodel.startStationName
            let str3 = str1+str2!
            startStationName.lineBreakMode = NSLineBreakMode.byWordWrapping
            startStationName.text = str3
            
            let str4 = Busmodel.endStationName
            let str5 = ")"
            let str6 = str4! + str5
            endStationName.text = str6
            
            
            let str = busmodel?.startTime
            //截取时间段字符串
            let startIndex = str?.index((str?.startIndex)!, offsetBy:10)
            let endIndex = str?.index(startIndex!, offsetBy:6)
            let result = str?.substring(with: startIndex!..<endIndex!)
            
            startTime.text = result
            
            let str7 = "¥"
            let str8 = Busmodel.dayPrice
            let str9 = "购票"
            let str10 = str7+str8!+str9
            dayPrice.text = str10
            
            let str11 = Busmodel.mileage
            let str12 = "公里"
            let str13 = str11!+str12
            mileage.text = str13
            
            
            let str14 = "约"
            let str15 = Busmodel.runTimes
            let str16 = "分钟"
            let str17 = str14+str15!+str16
            runTimes.text = str17
            
            
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
