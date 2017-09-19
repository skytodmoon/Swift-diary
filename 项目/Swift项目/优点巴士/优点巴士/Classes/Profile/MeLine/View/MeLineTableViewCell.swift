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
