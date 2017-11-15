//
//  VideoCell.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = UIColor.blueColor()
    }
}
