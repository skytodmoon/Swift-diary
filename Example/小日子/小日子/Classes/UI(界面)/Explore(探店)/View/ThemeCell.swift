//
//  ThemeCell.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ThemeCell: UITableViewCell {
    
    var model: ThemeModel? {
        didSet {
            titleLable.text = model!.title
            subTitleLable.text = model!.keywords
            backImageView.wxn_setImageWithURL(NSURL(string: model!.img!)!, placeholderImage: UIImage(named: "quesheng")!)
        }
    }
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var backImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .None
        self.titleLable.shadowOffset = CGSizeMake(-1, 1)
        self.titleLable.shadowColor = UIColor.colorWith(20, green: 20, blue: 20, alpha: 0.1)
        self.subTitleLable.shadowOffset = CGSizeMake(-1, 1)
        self.subTitleLable.shadowColor = UIColor.colorWith(20, green: 20, blue: 20, alpha: 0.1)
    }
    
    class func themeCellWithTableView(tableView: UITableView) -> ThemeCell {
        let identifier = "themeCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? ThemeCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ThemeCell", owner: nil, options: nil).last as? ThemeCell
            
        }
        
        return cell!
    }
}
