//
//  EmoticonViewCell.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class EmoticonViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var emoticon: EmoticonModel? {
        didSet {
            imageView.image = UIImage(named: (emoticon?.emoticonName)!)
        }
    }
    
}
