//
//  MeFooterView.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeFooterView: UIView {

    var settingHeightAction = {()}

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        /*请求参数*/
        var params = [String:String]()
        
        params["a"] = "square";
        params["c"] = "topic";
        
        HTTPTool.getData("http://api.budejie.com/api/api_open.php", parameters: params, failBlock: { (obj) -> Void in
            print("请求数据失败")
            }) { (obj) -> Void in
               let squares = Square.squares(obj["square_list"].array!)
                
                self.create(squares)
            print("请求数据成功")
        }
    }
    
    convenience init(frame: CGRect, settingHeightAction:() ->()) {
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
            button.addTarget(self, action: #selector(MeFooterView.webView(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(button)
            
            let col = CGFloat(i) % maxCols
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
            
            vc.url = NSURLRequest.init(URL:NSURL.init(string: button.square!.url)! )
            
            let tvc = UIApplication.sharedApplication().keyWindow?.rootViewController as! UITabBarController
            let nvc = tvc.selectedViewController as! UINavigationController
            
            vc.title = button.square?.name
            nvc.pushViewController(vc, animated: true)
        }
    }
    

    

}
