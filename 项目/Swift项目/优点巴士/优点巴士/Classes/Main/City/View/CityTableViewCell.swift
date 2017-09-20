//
//  CityTableViewCell.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var PriceBtn: UIButton!
    
    @IBOutlet weak var CityCellView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        PriceBtn.layer.borderColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0).cgColor;
        PriceBtn.layer.borderWidth = 1;
        PriceBtn.layer.cornerRadius = 10;
        
        CityCellView.layer.masksToBounds = true
        CityCellView.layer.cornerRadius = 5;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
