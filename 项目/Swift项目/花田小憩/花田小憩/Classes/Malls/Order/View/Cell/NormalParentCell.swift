//
//  NormalParentCell.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class NormalParentCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup()
    {
        selectionStyle = .None
        backgroundColor = UIColor(gray: 241)
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.snp_makeConstraints { (make) in
        make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
                }
    }

}
