//
//  ThumbCollectionViewCell.swift
//  微博
//
//  Created by 金亮齐 on 2017/9/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


import UIKit
import Kingfisher

class ThumbCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryCountLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImageView.layer.borderColor = UIColor(r: 240, g: 240, b: 240).cgColor
        thumbImageView.layer.borderWidth = 1
    }
    
    var thumbImageURL: String? {
        didSet {
            thumbImageView.kf.setImage(with: URL(string: thumbImageURL!))
        }
    }
}
