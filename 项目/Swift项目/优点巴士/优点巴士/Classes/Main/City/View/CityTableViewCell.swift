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
    
    @IBOutlet weak var lineNo: UILabel!
    @IBOutlet weak var startCity: UILabel!
    @IBOutlet weak var endCity: UILabel!
    @IBOutlet weak var startStationName: UILabel!
    @IBOutlet weak var endStationName: UILabel!
    @IBOutlet weak var dayPrice: UILabel!
    
    
    var cityModel : CityModel? {
        didSet {
            guard let citymodel = cityModel else { return }
            
            let str1 = citymodel.lineNo
            let str2 = "线"
            let str3 = str1 + str2
            lineNo.text = str3
            
            startCity.text = citymodel.startCity
            endCity.text = citymodel.endCity
            
            startStationName.text = citymodel.startStationName
            endStationName.text = citymodel.endStationName
            
            let str4 = "¥"
            let str5 = String(citymodel.dayPrice)
            let str6 = "购票"
            let str7 = str4 + str5 + str6
            dayPrice.text = str7
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dayPrice.layer.borderColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0).cgColor;
        dayPrice.layer.borderWidth = 1;
        dayPrice.layer.cornerRadius = 5;
        
        CityCellView.layer.masksToBounds = true
        CityCellView.layer.cornerRadius = 5;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
