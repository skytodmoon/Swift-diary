//
//  nearCell.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class nearCell: UICollectionViewCell {

    var nearModel: EventModel? {
        didSet {
            let urlStr = nearModel!.imgs![0]
            imageImageView.wxn_setImageWithURL(NSURL(string: urlStr)!, placeholderImage: UIImage(named: "quesheng")!)
            adressLabel.text = nearModel?.address
            titleLabel.text = nearModel?.title
            disLabel.text = nearModel!.distanceForUser
        }
    }
    
    @IBOutlet private weak var disLabel: UILabel!
    @IBOutlet private weak var adressLabel: UILabel!
    @IBOutlet private weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.whiteColor()
    }
}
