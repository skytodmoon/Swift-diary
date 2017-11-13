//
//  RecommendUserCell.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Kingfisher

class RecommendUserCell: UITableViewCell {

    var user: RecommendUser?
    @IBOutlet weak var headerView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var fansCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func set_User(_ user: RecommendUser) {
        self.user = user
        headerView.setHeaderImage(user.header)
        nameLabel.text = user.screen_name
        fansCountLabel.text = "\(user.fans_count)"
    }
    
}
