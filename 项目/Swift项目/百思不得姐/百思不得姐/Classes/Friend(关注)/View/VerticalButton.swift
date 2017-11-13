//
//  VerticalButton.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class VerticalButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView == nil {
            return
        }
        imageView?.frame = CGRect(x: 0, y: 0, width: imageView!.frame.width, height: imageView!.frame.height)
        titleLabel?.frame = CGRect(x: 0, y: imageView!.frame.height, width: frame.width, height: frame.height - imageView!.frame.height)
    }

}

extension VerticalButton {
    
    fileprivate func setupUI() {
        titleLabel?.textAlignment = .center
    }
}
