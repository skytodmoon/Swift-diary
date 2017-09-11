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
    
    var transitmodel : TransitModel? {
        
        didSet {
            guard let Tranmodel = transitmodel else { return }
            print(Tranmodel)
            station_name.text = Tranmodel.stationName
            station_direction.text = Tranmodel.stationName
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
