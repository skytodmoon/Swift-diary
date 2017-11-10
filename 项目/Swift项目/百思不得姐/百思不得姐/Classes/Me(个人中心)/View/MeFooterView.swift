//
//  MeFooterView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/10.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Alamofire
import MJExtension
import Kingfisher

class MeFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func loadData() {
        let url = URL(string: "http://api.budejie.com/api/api_open.php")
        let parameter = [
            "a": "square",
            "c": "topic",
        ]
        Alamofire.request(url!, method: .get, parameters: parameter).responseJSON { (response) in
            print(response)
        }
    }
    
}
