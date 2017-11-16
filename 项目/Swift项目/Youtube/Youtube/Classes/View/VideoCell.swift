//
//  VideoCell.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO *  1,604,684,607 views * 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGrayColor()
        return textView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews(){

        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView,separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Top,relatedBy: .Equal,toItem: thumbnailImageView,attribute: .Bottom, multiplier: 1,constant: 8))
        
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Left,relatedBy: .Equal,toItem: userProfileImageView,attribute: .Right, multiplier: 1,constant: 8))
        
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Right,relatedBy: .Equal,toItem: thumbnailImageView,attribute: .Right, multiplier: 1,constant: 0))
        
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Height,relatedBy: .Equal,toItem: self,attribute: .Height, multiplier: 0,constant: 20))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Top,relatedBy: .Equal,toItem: titleLabel,attribute: .Bottom, multiplier: 1,constant: 4))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Left,relatedBy: .Equal,toItem: userProfileImageView,attribute: .Right, multiplier: 1,constant: 8))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Right,relatedBy: .Equal,toItem: thumbnailImageView,attribute: .Right, multiplier: 1,constant: 0))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Height,relatedBy: .Equal,toItem: self,attribute: .Height, multiplier: 0,constant: 30))
    }
}
