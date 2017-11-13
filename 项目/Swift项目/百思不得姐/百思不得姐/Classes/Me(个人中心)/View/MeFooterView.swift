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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadData()
    }

    private func loadData() {
        let url = URL(string: "http://api.budejie.com/api/api_open.php")
        
        let parameter = [
            "a": "square",
            "c": "topic",
            ]
        
        Alamofire.request(url!, method: .get, parameters: parameter).responseJSON { (response) in
        
            switch response.result {
                
            case let .success(value):
                guard let dic = value as? [String: Any]  else{
                    return
                }
                guard let datas = dic["square_list"] as? [[String: Any]] else {
                    return
                }
                
                let contents = MeContent.mj_objectArray(withKeyValuesArray: datas) as! [MeContent]
                self.setupButtons(contents)
                
            case let .failure(error):
                print("me contetn error = \(error)")
            }
        }
    }
    
    private func setupButtons(_ data: [MeContent]){
        let maxCols: CGFloat = 4
        let buttonW = screenWidth / maxCols
        let buttonH = buttonW
        
        for i in 0..<data.count {
            
            let button = MeVerticalButton()
            button.content = data[i]
            // 行
            let row = i / Int(maxCols)
            // 列
            let col = CGFloat(i).truncatingRemainder(dividingBy: maxCols)
            let x = col * buttonW
            let y = CGFloat(row) * buttonH
            button.frame = CGRect(x: x, y: y, width: buttonW, height: buttonH)
            addSubview(button)
        }
        
        // 总页数 == (总个数 + 每页的最大数 - 1) / 每页最大数
        let rows = (CGFloat(data.count) + maxCols - 1) / maxCols
        frame = CGRect(x: 0, y: 0, width: screenWidth, height: rows * buttonH)
    }
    
}
