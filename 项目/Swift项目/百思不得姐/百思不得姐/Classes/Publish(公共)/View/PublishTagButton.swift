//
//  PublishTagButton.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class PublishTagButton: UIButton {

    class func publishTagButton(_ isAdd: Bool) -> PublishTagButton {
        
        return PublishTagButton.init(isAdd)
        
    }
    
    convenience init(_ isAdd: Bool) {
        self.init(type: .custom)
        setupView(isAdd)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(_ isAdd: Bool) {
        if isAdd {
            setImage(UIImage.init(named: "chose_tag_close_icon"), for: .normal)
        }
        backgroundColor = UIColor(red: 160.0 / 255, green: 220.0 / 255, blue: 72.0 / 255, alpha: 1)
        titleLabel?.textColor = UIColor.white
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}
