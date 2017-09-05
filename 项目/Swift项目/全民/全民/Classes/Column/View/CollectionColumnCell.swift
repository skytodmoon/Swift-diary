//
//  CollectionColumnCell.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionColumnCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var gameModel: ColumnModel? {
        didSet {
            guard let iconURL = URL(string: gameModel?.img ?? "") else { return }
            imageView.kf.setImage(with: iconURL)
            nameLabel.text = gameModel?.cname
        }
    }

}
