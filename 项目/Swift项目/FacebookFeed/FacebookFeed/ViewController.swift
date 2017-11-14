//
//  ViewController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

let  cellId = "cellId"

class FeedController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Facebook Feed"
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(view.frame.width, 380)
    }

}

class FeedCell: UICollectionViewCell {
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
        let attributedText = NSMutableAttributedString(string: "醉看红尘这场梦", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)])
        attributedText.appendAttributedString(NSAttributedString(string: "\n 22岁 * 深圳 南山", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(12), NSForegroundColorAttributeName: UIColor(red: 155/255,green: 161/255, blue: 171/255, alpha: 1)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe_small")
        attachment.bounds = CGRectMake(0, -2, 12, 12)
        attributedText.appendAttributedString(NSAttributedString(attachment: attachment))
        label.attributedText = attributedText
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "headImage.png")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "一位喜欢Swift语言的ios程序员"
        textView.font = UIFont.systemFontOfSize(14)
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "You name")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let linkesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "488 条  10.7K 赞"
        label.font = UIFont.systemFontOfSize(12)
        return label
    }()
    
    
    func setupViews(){
        backgroundColor = UIColor.whiteColor()
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(linkesCommentsLabel)
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat("H:|[v0]|", views:statusImageView)
        addConstraintsWithFormat("H:|-12-[v0]|", views:linkesCommentsLabel)
        addConstraintsWithFormat("V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-|", views: profileImageView,statusTextView,statusImageView,linkesCommentsLabel)

    }
}


extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
            for (index, view) in views.enumerate() {
                let key = "v\(index)"
                viewsDictionary[key] = view
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        }
}
