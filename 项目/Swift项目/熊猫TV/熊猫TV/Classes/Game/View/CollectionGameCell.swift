//
//  CollectionGameCell.swift
//  熊猫TV
//
//  Created by 金亮齐 on 2017/12/27.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var gameModel: GameModel? {
        didSet {
            guard let iconURL = URL(string: gameModel?.img ?? "") else { return }
            imageView.kf.setImage(with: iconURL)
            nameLabel.text = gameModel?.cname
        }
    }
}
