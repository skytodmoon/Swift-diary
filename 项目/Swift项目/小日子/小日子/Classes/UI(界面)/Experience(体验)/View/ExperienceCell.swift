//
//  ExperienceCell.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ExperienceCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    var eventModel: EventModel? {
        didSet {
            titleLabel.text = eventModel!.title
            
            if eventModel!.imgs?.count > 0 {
                let urlStr = eventModel!.imgs![0]
                imageImageView.wxn_setImageWithURL(NSURL(string: urlStr)!, placeholderImage: UIImage(named: "quesheng")!)
            }
        }
    }

    
}
