//
//  MeTripTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeTripTableViewCell: UITableViewCell {
    
    @IBOutlet var lineLabel: UILabel!
    @IBOutlet var lineNo: UILabel!
    @IBOutlet var startStation: UILabel!
    @IBOutlet var endStation: UILabel!
    @IBOutlet var startTime: UILabel!
    @IBOutlet var driver: UILabel!
    @IBOutlet var busNo: UILabel!
    @IBOutlet var arriveTime: UILabel!
    
    var metripmodel : MeTripModel? {
        didSet {
            

            lineLabel.layer.cornerRadius = 3
            lineLabel.layer.masksToBounds = true
            lineLabel.text = metripmodel?.lineLabel
            
            lineNo.text = metripmodel?.lineNo
            
            let str1="("
            let str2 = metripmodel?.startStation
            let str3 = str1+str2!
            startStation.text = str3
            
            let str4 = metripmodel?.endStation
            let str5 = ")"
            let str6 = str4! + str5
            endStation.text = str6
            
//          startTime = "2017-09-13 07:40:00";
            let str = metripmodel?.startTime
            //截取时间段字符串
            let startIndex = str?.index((str?.startIndex)!, offsetBy:10)
            let endIndex = str?.index(startIndex!, offsetBy:6)
            let result = str?.substring(with: startIndex!..<endIndex!)
            
            startTime.text = result
            
            driver.text = metripmodel?.driver
            busNo.text = metripmodel?.busNo
            arriveTime.lineBreakMode = NSLineBreakMode.byWordWrapping
            arriveTime.text = metripmodel?.arriveTime
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
