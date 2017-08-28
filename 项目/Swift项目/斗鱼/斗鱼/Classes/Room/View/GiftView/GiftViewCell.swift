//
//  GiftViewCell.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GiftViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var giftModel : GiftModel? {
        didSet {
            iconImageView.setImage(giftModel?.img2, UIImage(named: "room_btn_gift"), true)
            subjectLabel.text = giftModel?.subject
            priceLabel.text = "\(giftModel?.coin ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedView = UIView()
        selectedView.layer.cornerRadius = 5
        selectedView.layer.masksToBounds = true
        selectedView.layer.borderColor = UIColor.orange.cgColor
        selectedView.layer.borderWidth = 1
        selectedView.backgroundColor = UIColor.black
        
        selectedBackgroundView = selectedView
    }
}
