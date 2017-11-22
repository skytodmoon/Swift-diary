//
//  BaseCell.swift
//  FbMessenger
//
//  Created by 金亮齐 on 2017/11/22.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
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
