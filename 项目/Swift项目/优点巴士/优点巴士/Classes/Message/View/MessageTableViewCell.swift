//
//  MessageTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet var messageimgUrl: UIImageView!

    @IBOutlet var messagetitle: UILabel!
    
    @IBOutlet var mesageview: UIView!
    
    var messagemodel : MessageModel? {
        didSet {
            // 校验模型是否有值
            guard let message = messagemodel else { return }
            
            // 设置名称
            messagetitle.text = message.title
            
            // 设置封面图片
            guard let iconURL = URL(string: message.imgUrl) else { return }
            messageimgUrl.kf.setImage(with: iconURL)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mesageview.layer.masksToBounds = true
        mesageview.layer.cornerRadius = 10
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
