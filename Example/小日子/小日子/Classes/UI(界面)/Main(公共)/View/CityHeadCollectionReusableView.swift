//
//  CityHeadCollectionReusableView.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CityHeadCollectionReusableView: UICollectionReusableView {
    
    var headTitleLabel: UILabel = UILabel()
    var headTitle: String? {
        didSet {
            headTitleLabel.text = headTitle
            headTitleLabel.font = UIFont.systemFontOfSize(18)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        headTitleLabel.textAlignment = .Center
        headTitleLabel.font = UIFont.systemFontOfSize(22)
        headTitleLabel.textColor = UIColor.blackColor()
        addSubview(headTitleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.headTitleLabel.frame = self.bounds
    }
}

class CityFootCollectionReusableView: UICollectionReusableView {
    
    var titleLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel?.text = "更多城市,敬请期待..."
        titleLabel?.textAlignment = .Center
        titleLabel?.textColor = UIColor.darkGrayColor()
        titleLabel?.font = UIFont.systemFontOfSize(16)
        addSubview(titleLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame = self.bounds
    }
}