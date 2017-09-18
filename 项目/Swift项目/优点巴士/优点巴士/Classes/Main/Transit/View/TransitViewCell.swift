//
//  TransitViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TransitViewCell: UITableViewCell {
    
    @IBOutlet var station_name: UILabel!
    
    @IBOutlet var station_direction: UILabel!
    
    @IBOutlet var distance: UILabel!
    
    var transitmodel : TransitModel? {
        
        didSet {
            guard let Tranmodel = transitmodel else { return }
            station_name.text = Tranmodel.station_name
            
            
            let str11 = "("
            let str12 = Tranmodel.station_direction
            let str13 = ")"
            let str14 = str11+str12+str13
            station_direction.text = str14
            
            let str1 = "距离您"
            let str2 = String(Tranmodel.distance)
            let str3 = "米"
            let str4 = str1 + str2 + str3
            distance.text = str4
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
