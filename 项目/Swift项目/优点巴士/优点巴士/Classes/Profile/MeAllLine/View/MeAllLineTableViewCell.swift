//
//  MeAllLineTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeAllLineTableViewCell: UITableViewCell {
    
    @IBOutlet var MeAllView: UIView!
    
    @IBOutlet var lineLabel: UILabel!
    
    @IBOutlet var lineNo: UILabel!
    
    @IBOutlet var endStationName: UILabel!
    
    @IBOutlet var startStationName: UILabel!
    
    @IBOutlet var dayPrice: UILabel!
    
    var meallLinemodel : MeAllLineModel? {
        didSet {
            
            MeAllView.layer.cornerRadius = 3
            MeAllView.layer.masksToBounds = true
            
            lineLabel.layer.cornerRadius = 3
            lineLabel.layer.masksToBounds = true
            lineLabel.text = meallLinemodel?.lineLabel
            
            lineNo.text = meallLinemodel?.lineNo
            
        
            let str1 = "¥"
            let str2 = meallLinemodel?.dayPrice
            let str3 = "购票"
            let str4 = str1+str2!+str3
            dayPrice.text = str4
            
            endStationName.text = meallLinemodel?.endStationName
            startStationName.text = meallLinemodel?.startStationName
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
