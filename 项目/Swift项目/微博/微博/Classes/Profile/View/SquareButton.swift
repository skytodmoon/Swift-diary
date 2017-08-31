//
//  SquareButton.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class SquareButton: UIButton {

    var square:Square?{
        didSet{
            self.setTitle(square!.name, for: .normal)
            self.kf.setImage(with: URL.init(string: (square?.icon)!)!, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.titleLabel!.textAlignment = .center
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.setBackgroundImage(UIImage.init(named: "mainCellBackground"), for: .normal)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /* 调整图片 */
        self.imageView!.y = self.height * 0.15;
        self.imageView!.width = self.width * 0.5;
        self.imageView!.height = self.imageView!.width;
        self.imageView!.centerX = self.width * 0.5;
        
        /* 调整文字 */
        self.titleLabel!.x = 0;
        self.titleLabel!.y = self.imageView!.frame.maxY;
        self.titleLabel!.width = self.width;
        self.titleLabel!.height = self.height - self.titleLabel!.y;
        
    }


}
