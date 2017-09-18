//
//  LiveFucusViewCell.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class LiveFucusViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var liveImageView: UIImageView!
    
    var anchorViewModel: LiveAnchorModel? {
        didSet{
            iconImageView.setImage(anchorViewModel?.pic51, UIImage(named:""), true)
            nickNameLabel.text = anchorViewModel?.name
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
