//
//  NewsThreePicCell.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import YYWebImage

class NewsThreePicCell: UITableViewCell {

    var postModel: ArticleListModel? {
        didSet {
            if postModel?.morepic?.count == 1 {
                iconView1.image = nil
                iconView1.yy_setImageWithURL(NSURL(string: postModel!.morepic![0]), placeholder: UIImage(named: "placeholder_logo"))
            } else if postModel?.morepic?.count == 2 {
                iconView1.image = nil
                iconView2.image = nil
                iconView1.yy_setImageWithURL(NSURL(string: postModel!.morepic![0]), placeholder: UIImage(named: "placeholder_logo"))
                iconView2.yy_setImageWithURL(NSURL(string: postModel!.morepic![1]), placeholder: UIImage(named: "placeholder_logo"))
            } else if postModel?.morepic?.count == 3 {
                iconView1.image = nil
                iconView2.image = nil
                iconView3.image = nil
                iconView1.yy_setImageWithURL(NSURL(string: postModel!.morepic![0]), placeholder: UIImage(named: "placeholder_logo"))
                iconView2.yy_setImageWithURL(NSURL(string: postModel!.morepic![1]), placeholder: UIImage(named: "placeholder_logo"))
                iconView3.yy_setImageWithURL(NSURL(string: postModel!.morepic![2]), placeholder: UIImage(named: "placeholder_logo"))
            }
            
            articleTitleLabel.text = postModel?.title!
            timeLabel.text = postModel?.newstime!
            commentLabel.text = postModel?.plnum!
            showNumLabel.text = postModel?.onclick!
        }
    }
    
    @IBOutlet weak var iconView1: UIImageView!
    @IBOutlet weak var iconView2: UIImageView!
    @IBOutlet weak var iconView3: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var showNumLabel: UILabel!
    
    /**
     计算行高
     */
    func getRowHeight(postModel: ArticleListModel) -> CGFloat {
        self.postModel = postModel
        layoutIfNeeded()
        return CGRectGetMaxY(timeLabel.frame) + 15
    }

    
}
