//
//  TransitViewCellHeaderCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TransitViewCellHeaderCell: UITableViewCell {
    
    @IBOutlet weak var line_name: UILabel!
    
    @IBOutlet weak var end_station: UILabel!
    
    var transitHeadermodel : TransitHeaderModel? {
        
        didSet {
            guard let TranHeadermodel = transitHeadermodel else { return }
            line_name.text = TranHeadermodel.line_name
            end_station.text = TranHeadermodel.end_station
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
