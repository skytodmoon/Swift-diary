//
//  MeFooterView.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PKHUD

class MeFooterView: UIView {
    
    var settingHeightAction = {()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        var params = [String:String]()
        
        params["a"] = "square";
        params["c"] = "topic";
        
        Alamofire.request("http://api.budejie.com/api/api_open.php", method: .get, parameters: params).responseJSON { (response) in
            HUD.flash(.success, delay: 2.0)
            if let value = response.result.value {
                let dict = JSON(value)
                    let squares = Square.squares(array: dict["square_list"].array!)
                    self.create(squares: squares)
                }
        }
    }
    
    convenience init(frame: CGRect, settingHeightAction:@escaping () ->()) {
        self.init(frame:frame)
        self.settingHeightAction = settingHeightAction
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create(squares:NSArray) {
        
        let maxCols:CGFloat = 4
        
        
        let buttonW = screenW / maxCols - 1
        let buttonH = buttonW - 1
        
        for i in 0 ..< 16{
            
            let button =  SquareButton.init()
            let square = squares[i] as! Square
            button.square = square
            button.addTarget(self, action: #selector(MeFooterView.webView), for: .touchUpInside)
            self.addSubview(button)
            
            /*
             '%' is unavailable: Use truncatingRemainder instead
             let col = CGFloat(i) % maxCols
             */
            
            let col = CGFloat(i).truncatingRemainder(dividingBy: maxCols);
            let row = i / Int(maxCols)
            
            button.width = buttonW
            button.height = buttonH
            button.x = col * buttonW
            button.y = CGFloat(row) * buttonH
            
            
            button.frame = CGRect(x: button.x, y: button.y, width: button.width, height: button.height)
            
        }
        
        let rows = (CGFloat(squares.count) + maxCols - 1) / maxCols
        self.height = rows * buttonH
        
    }
    
    func webView(button:SquareButton) {
        
        if button.square!.url.hasPrefix("http"){
            let vc = QJLWebViewController.init()
            
            vc.url = URLRequest.init(url: URL.init(string: (button.square?.url)!)!)
            let tvc = UIApplication.shared.keyWindow?.rootViewController as! UITabBarController
            let nvc = tvc.selectedViewController as! UINavigationController
            vc.title = button.square?.name
            nvc.pushViewController(vc, animated: true)
        }
    }
}
