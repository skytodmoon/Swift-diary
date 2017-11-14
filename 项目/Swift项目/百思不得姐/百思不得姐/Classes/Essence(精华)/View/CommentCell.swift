//
//  CommentCell.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Kingfisher

class CommentCell: UITableViewCell {
    
    static let commentCellIdentifier: String = "commentCell"
    
    static func commentCell(_ tableView: UITableView) -> CommentCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.commentCellIdentifier)
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("CommentCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! CommentCell
    }
    
    @IBOutlet weak var headerView: UIImageView!
    
    @IBOutlet weak var sexView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var zaiCountLabel: UILabel!
    
    public func setupUI(_ comment: Comment) {
        
        headerView.setHeaderImage(comment.user.profile_image)
        
        sexView.image = comment.user.sex == "m" ? UIImage(named: "Profile_manIcon") : UIImage(named: "Profile_womanIcon")
        
        nameLabel.text = comment.user.username
        
        contentLabel.text = comment.content
        
        zaiCountLabel.text = "\(comment.like_count)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - 设置为true 让自身成为第一响应者
    override var canBecomeFirstResponder: Bool {
        return true
    }
    // MARK: - 设置为false 不使用系统自带的item
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
