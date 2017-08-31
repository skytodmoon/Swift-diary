//
//  StatusTableViewCell.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


let PictureViewCellReuseIdentifier = "PictureViewCellReuseIdentifier"

//MAKR: - 枚举TableviewCell
enum StatusTableViewCellIdentifier: String {
    case NormalCell  = "NormalCell"
    case ForwardCell = "ForwardCell"
    static func cellID(status: Status) -> String{
        return status.retweeted_status != nil ? ForwardCell.rawValue : NormalCell.rawValue
    }
}

class StatusTableViewCell: UITableViewCell {
    
    lazy var pictureSize: CGSize = CGSize.zero
    
    var status: Status?{
        didSet{
    
            topView.status = status
            contentLabel.text = status?.text
            pictureView.status = status?.retweeted_status != nil ? status?.retweeted_status :  status
            pictureSize = pictureView.calculateImageSize()
//            
//            pictureView.snp.makeConstraints { (make) -> Void in
//                make.height.equalTo(pictureSize.height)
//                make.width.equalTo(pictureSize.width)
//            }

//            pictureView.snp.updateConstraints { (make) -> Void in
//                make.height.equalTo(pictureSize.height)
//                make.width.equalTo(pictureSize.width)
//            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    

    //MARK: - 设置UI界面
    func setupUI() {
        
        contentView.addSubview(topView)
        contentView.addSubview(contentLabel)
        contentView.addSubview(pictureView)
        contentView.addSubview(footerView)
        
        let width = UIScreen.main.bounds.width
        topView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView)
            make.width.equalTo(width)
            make.height.equalTo(60)
        }
        contentLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.left.equalTo(topView.snp.left).offset(10)
        }
        footerView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(width)
            make.top.equalTo(pictureView.snp.bottom).offset(10)
            make.height.equalTo(44)
            make.left.equalTo(self.contentView.snp.left)
        }
    }
    
    func rowHeight(status: Status)  -> CGFloat {
        self.status = status
        
        self.layoutIfNeeded()
        
        return footerView.frame.maxY
    }
    
    private lazy var topView: StatusTableViewTopView = StatusTableViewTopView()
    //MARK: - 懒加载contentLabel
    lazy var contentLabel: UILabel = {
        let label = UILabel.createLabel(color: UIColor.darkGray, fontSize: 15)
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 20
        return label
    }()
    //MARK: - 懒加载pictureView
    lazy var pictureView: StatusPictureView = StatusPictureView()
    //MARK: - 懒加载footerView
    lazy var footerView: StatusTableViewBottomView = StatusTableViewBottomView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
