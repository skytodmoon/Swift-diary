//
//  LiveViewCell.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class LiveViewCell: UICollectionViewCell {
    
    // MARK: 控件属性
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var liveImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onlinePeopleLabel: UIButton!
    
    
    // MARK: -- 定义属性
    var anchorModel : LiveAnchorModel? {
        didSet {
            albumImageView.setImage((anchorModel?.isEvenIndex)! ? anchorModel?.pic74 : anchorModel?.pic51, UIImage(named: "home_pic_default"), false)
            liveImageView.isHidden = anchorModel?.live == 0
            nickNameLabel.text = anchorModel?.name
            onlinePeopleLabel.setTitle(" " + "\(anchorModel?.focus ?? 0)", for: .normal)
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
