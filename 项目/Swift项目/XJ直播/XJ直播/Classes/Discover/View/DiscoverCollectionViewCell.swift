//
//  DiscoverCollectionViewCell.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/26.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Kingfisher

class DiscoverCollectionViewCell: UICollectionViewCell {

    /// 观看人数
    @IBOutlet weak var onlineLabel: UILabel!
    /// 主播名称
    @IBOutlet weak var nickNameLabel: UILabel!
    /// 主播头像
    @IBOutlet weak var iconImageView: UIImageView!
    /// 是否开播
    @IBOutlet weak var liveImageView: UIImageView!
    
    
    var anchorModel: AnchorModel? {
        
        didSet {
            
            onlineLabel.text = "\(String(describing: anchorModel?.focus))人观看"
            nickNameLabel.text = anchorModel?.name
            iconImageView.setImage(anchorModel?.pic51, UIImage(named: "home_pic_default"), false)
            liveImageView.isHidden = anchorModel?.live == 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
