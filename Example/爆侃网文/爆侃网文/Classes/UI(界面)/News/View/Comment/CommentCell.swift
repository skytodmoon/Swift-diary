//
//  CommentCell.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import YYWebImage

protocol CommentCellDelegate {
    func didTappedStarButton(button: UIButton, commentModel: CommentModel)
}

class CommentCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    var delegate: CommentCellDelegate?
    
    var commentModel: CommentModel? {
        didSet {
            avatarImageView.yy_setImageWithURL(NSURL(string: commentModel!.userpic!), options: YYWebImageOptions.IgnorePlaceHolder)
            usernameLabel.text = commentModel!.plusername!
            timeLabel.text = commentModel!.saytime!
            contentLabel.text = commentModel!.saytext!
            starButton.setTitle("\(commentModel!.zcnum)", forState: UIControlState.Normal)
        }
    }
    
    func getCellHeight(commentModel: CommentModel) -> CGFloat {
        self.commentModel = commentModel
        layoutIfNeeded()
        return CGRectGetMaxY(contentLabel.frame) + 10
    }
    
    /** 点击了赞 */
    @IBAction func didTappedStarButton(sender: UIButton) {
        delegate?.didTappedStarButton(sender, commentModel: commentModel!)
    }

    
}
