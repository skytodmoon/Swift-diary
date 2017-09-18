//
//  DiscoverCollectionViewCell.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {

    /// 观看人数
    @IBOutlet weak var onlineLabel: UILabel!
    /// 主播名称
    @IBOutlet weak var nickNameLabel: UILabel!
    /// 主播头像
    @IBOutlet weak var iconImageView: UIImageView!
    /// 是否开播
    @IBOutlet weak var liveImageView: UIImageView!
    
    
    var anchorModel: LiveAnchorModel? {
        
        didSet {
            
            onlineLabel.text = "\(anchorModel?.focus)人观看"
            nickNameLabel.text = anchorModel?.name
    
            iconImageView.setImage(anchorModel?.pic51, UIImage(named: "live_pic_default"), false)
            liveImageView.isHidden = anchorModel?.live == 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
