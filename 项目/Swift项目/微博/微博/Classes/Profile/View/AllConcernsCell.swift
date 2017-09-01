//
//  AllConcernsCell.swift
//  微博
//
//  Created by 金亮齐 on 2017/9/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher
import IBAnimatable

class AllConcernsCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var concernNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weitoutiao: WeiTouTiao? {
        didSet{
            
        }
    }
    
    var myConcern: MyConcern? {
        didSet {
            iconImageView.kf.setImage(with: URL(string: (myConcern?.icon!)!))
            concernNameLabel.text = myConcern?.name!
            descriptionLabel.text = myConcern?.description!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
}
