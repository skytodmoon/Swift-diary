//
//  FeedCell.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit


class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            
            if let name = post?.name {
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)])
                attributedText.appendAttributedString(NSAttributedString(string: "\n 22岁 * 深圳 南山", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(12), NSForegroundColorAttributeName: UIColor.rgb(155, green: 161, blue: 161)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe_small")
                attachment.bounds = CGRectMake(0, -2, 12, 12)
                attributedText.appendAttributedString(NSAttributedString(attachment: attachment))
                nameLabel.attributedText = attributedText
            }
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImagename = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImagename)
            }
            
            if let statusImageName = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImageName)
            }
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = UIImage(named: "headImage")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "一位喜欢Swift语言的ios程序员"
        textView.font = UIFont.systemFontOfSize(14)
        textView.scrollEnabled = true
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = UIImage(named: "You name")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let linkesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "488 条  10.7K 赞"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        return label
    }()
    
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = FeedCell.buttonForTitle("Like", imageName: "Like")
    let commentButton: UIButton = FeedCell.buttonForTitle("Comment", imageName: "comment")
    let shareButton: UIButton = FeedCell.buttonForTitle("Share", imageName: "Share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), forState: .Normal)
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        return button
    }
    
    func setupViews(){
        backgroundColor = UIColor.whiteColor()
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(linkesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat("H:|[v0]|", views:statusImageView)
        addConstraintsWithFormat("H:|-12-[v0]|", views:linkesCommentsLabel)
        addConstraintsWithFormat("H:|-12-[v0]-12-|", views:dividerLineView)
        
        
        addConstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", views:likeButton,commentButton,shareButton)
        addConstraintsWithFormat("V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView,statusTextView,statusImageView,linkesCommentsLabel,dividerLineView,likeButton)
        addConstraintsWithFormat("V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat("V:[v0(44)]|", views: shareButton)
    }
}
