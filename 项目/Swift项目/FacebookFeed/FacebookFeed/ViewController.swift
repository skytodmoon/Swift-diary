//
//  ViewController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

let  cellId = "cellId"

class Post {
    var name: String?
    var statusText: String?
    var profileImageName: String?
    var statusImageName: String?
    var numLikes: Int?
    var numContent: Int?
}

class FeedController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postMark = Post()
        postMark.name = "章紫玲"
        postMark.statusText = "我是一位舞蹈老师"
        postMark.profileImageName = "headImage1"
        postMark.statusImageName = "YouName2"
        postMark.numLikes = 400
        postMark.numContent = 123
        
        let postSteve = Post()
        postSteve.name = "醉看红尘这场梦"
        postSteve.statusText = "我本以为我只爱代码，自从“她”的出现改变了我，\n让我逐渐的产生好感，冷漠>关注>喜欢>爱意，让我经历了四种变化，她是我的另一半，\n她的舞蹈身影让我迷恋，她弹的钢琴让我陶醉，爱到写代码都会发呆想她，很感谢上帝赐予我这么好的女孩。"
        postSteve.profileImageName = "headImage"
        postSteve.statusImageName = "You name"
        postSteve.numLikes = 1000
        postSteve.numContent = 55
        
        let postGandhi = Post()
        postGandhi.name = "测试"
        postGandhi.statusText = "测试测试测试测试测试测试测试测试测试测试测试测试测试\n测试测试测试测试测试测试测试测试测试测试测试测试测试\n测试测试测试测试测试测试测试测试测试测试测试测试测试\n"
        postGandhi.profileImageName = "headImage"
        postGandhi.statusImageName = "YouName2"
        postGandhi.numLikes = 1000
        postGandhi.numContent = 55
        
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postGandhi)
        
        navigationItem.title = "Facebook Feed"
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let feedCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
        return feedCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        if let statusText = posts[indexPath.item].statusText{
            let rect = NSString(string: statusText).boundingRectWithSize(CGSizeMake(view.frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil)
            
            let knownHeigth: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            return CGSizeMake(view.frame.width, rect.height + knownHeigth + 24)
        }
        
        return CGSizeMake(view.frame.width, 500)
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }

}

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


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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
