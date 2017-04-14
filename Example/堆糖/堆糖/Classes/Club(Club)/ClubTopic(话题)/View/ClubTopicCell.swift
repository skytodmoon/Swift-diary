//
//  ClubTopicCell.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ClubTopicCell: UITableViewCell {
    
    var clubTopicModel: ClubTopicModel!{
        
        didSet{
            
            photoImageView.yy_imageURL = NSURL(string: clubTopicModel.sender.avatar)
            usernameLabel.text = clubTopicModel.sender.username
            datetimeLabel.text = "\(clubTopicModel.add_datetime_ts)"
            contentLabel.text = clubTopicModel.content
            reply_countButton.setTitle("\(clubTopicModel.reply_count)", forState: UIControlState.Normal)
            like_countButton.setTitle("\(clubTopicModel.like_count)", forState: UIControlState.Normal)
            repliesLabel.text = clubTopicModel.replies.sender.username   +  clubTopicModel.replies.content
        }
    }
    

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var datetimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reply_countButton: UIButton!
    @IBOutlet weak var like_countButton: UIButton!
    @IBOutlet weak var repliesLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var allTopicButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
