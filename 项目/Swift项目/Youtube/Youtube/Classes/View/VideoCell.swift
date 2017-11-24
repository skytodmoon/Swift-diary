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
    
    var video: Video?{
        didSet{
            
            titleLabel.text = video?.title
            
            setupThumbnailImage()
            
            setupProfileImage()
            
            if let profileImageName = video?.channel?.profileImageName {
                userProfileImageView.image = UIImage(named: profileImageName)
            }
            
            if let channeName = video?.channel?.name, numberOfViews = video?.number_of_views{
                
                let numberFormatter = NSNumberFormatter()
                numberFormatter.numberStyle = .DecimalStyle
                
                let subtitText = "\(channeName) * \(numberFormatter.stringFromNumber(numberOfViews)) * 2 year ago"
                subtitleTextView.text = subtitText
            }
            
            if let title = video?.title {
                let size = CGSizeMake(frame.width - 16 - 44 - 8 - 16, 1000)
                let options = NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRectWithSize(size, options: options, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
                    print(estimatedRect)
//                if estimatedRect.size.height > 20 {
//                    titleLableHeightConstraint?.constant = 44
//                }else {
//                    titleLableHeightConstraint?.constant = 20
//                }
            }
        }
    }
    
    func setupProfileImage(){
        if let profileImageUrl = video?.channel?.profileImageName{
            
            userProfileImageView.loadImageUsingUrlString(profileImageUrl)
        }
    }
    
    func setupThumbnailImage(){
        if let thumbnailImageUrl = video?.thumbnail_image_name{
            thumbnailImageView.loadImageUsingUrlString(thumbnailImageUrl)
        }
    }
    
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .ScaleAspectFill
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
        label.numberOfLines = 2
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
    
    var titleLableHeightConstraint: NSLayoutConstraint?
    
    override func setupViews(){

        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnailImageView,userProfileImageView,separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        //top Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Top,relatedBy: .Equal,toItem: thumbnailImageView,attribute: .Bottom, multiplier: 1,constant: 8))
        //left Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Left,relatedBy: .Equal,toItem: userProfileImageView,attribute: .Right, multiplier: 1,constant: 8))
        //right Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel,attribute: .Right,relatedBy: .Equal,toItem: thumbnailImageView,attribute: .Right, multiplier: 1,constant: 0))
        
        //height Constraint
        titleLableHeightConstraint = NSLayoutConstraint(item: titleLabel,attribute: .Height,relatedBy: .Equal,toItem: self,attribute: .Height, multiplier: 0,constant: 44)
        addConstraint(titleLableHeightConstraint!)
        
        //top Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Top,relatedBy: .Equal,toItem: titleLabel,attribute: .Bottom, multiplier: 1,constant: 4))
        //left Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Left,relatedBy: .Equal,toItem: userProfileImageView,attribute: .Right, multiplier: 1,constant: 8))
        //right Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Right,relatedBy: .Equal,toItem: thumbnailImageView,attribute: .Right, multiplier: 1,constant: 0))
        //height Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView,attribute: .Height,relatedBy: .Equal,toItem: self,attribute: .Height, multiplier: 0,constant: 30))
    }
}
