//
//  ExploreMainController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire

private let urlString = "http://www.duitang.com/napi/index/groups/?app_code=gandalf&app_version=5.9%20rv%3A150681&device_name=Unknown%20iPhone&device_platform=iPhone6%2C1&locale=zh_CN&platform_name=iPhone%20OS&platform_version=9.2.1&screen_height=568&screen_width=320"

class ExploreMainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sendRequestRequest()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func sendRequestRequest() {

        // Add Headers
        let headers = [
            "Cookie":"sessionid=cb7df479-c133-4a21-ae40-993de9faf434",
            ]
        
        // Add URL parameters
        let urlParams = [
            "app_code":"gandalf",
            "app_version":"5.9 rv:150681",
            "device_name":"Unknown iPhone",
            "device_platform":"iPhone6,1",
            "locale":"zh_CN",
            "platform_name":"iPhone OS",
            "platform_version":"9.2.1",
            "screen_height":"568",
            "screen_width":"320",
            ]
        
        // Fetch Request
        Alamofire.request(.GET, "http://www.duitang.com/napi/index/groups/", parameters: urlParams, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    print("请求成功")
                }
                else {
                    print("请求失败")
                }
        }
    }


}
