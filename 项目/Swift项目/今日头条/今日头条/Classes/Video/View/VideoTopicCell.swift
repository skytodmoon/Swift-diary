//
//  VideoTopicCell.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class VideoTopicCell: UITableViewCell {
    
    /// 标题 label
    @IBOutlet weak var titleLabel: UILabel!
    /// 播放数量
    @IBOutlet weak var playCountLabel: UILabel!
    /// 时间 label
    @IBOutlet weak var timeLabel: UILabel!
    /// 背景图片
    @IBOutlet weak var bgImageButton: UIButton!
    /// 用户头像
    @IBOutlet weak var headButton: UIButton!
    @IBOutlet weak var headCoverButton: UIButton!
    /// 用户昵称
    @IBOutlet weak var nameLable: UILabel!
    /// 关注数量
    @IBOutlet weak var concernButton: UIButton!
    /// 评论数量
    @IBOutlet weak var commentButton: UIButton!
    /// 更多按钮
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var bottomLineView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        headButton.layer.cornerRadius = 15
        headButton.layer.masksToBounds = true
        contentView.theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.videoTitleColor"
        nameLable.theme_textColor = "colors.black"
        commentButton.theme_setTitleColor("colors.black", forState: .normal)
        concernButton.theme_setTitleColor("colors.black", forState: .normal)
        bottomLineView.theme_backgroundColor = "colors.separatorColor"
        playCountLabel.theme_textColor = "colors.playCountColor"
        concernButton.theme_setImage("images.videoConcernButton", forState: .normal)
        commentButton.theme_setImage("images.videoCommentButton", forState: .normal)
        moreButton.theme_setImage("images.videoMoreButton", forState: .normal)
        bgImageButton.theme_setImage("images.videoBgImageButton", forState: .normal)
    }
    
    var videoTopic: WeiTouTiao? {
        didSet {
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
