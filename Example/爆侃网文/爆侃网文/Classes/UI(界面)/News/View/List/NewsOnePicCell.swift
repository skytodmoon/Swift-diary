//
//  NewsOnePicCell.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import YYWebImage

class NewsOnePicCell: UITableViewCell {

    var postModel: ArticleListModel? {
        didSet {
            iconView.image = nil
            iconView.yy_setImageWithURL(NSURL(string: postModel!.titlepic!), placeholder: UIImage(named: "placeholder_logo"))
            articleTitleLabel.text = postModel?.title!
            timeLabel.text = postModel?.newstime!
            commentLabel.text = postModel?.plnum!
            showNumLabel.text = postModel?.onclick!
        }
    }
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var showNumLabel: UILabel!
}
