//
//  MessageController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


class MessageController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var messageVM : MessageViewModel = MessageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

// MARK:- 请求数据
extension MessageController {
    func loadData() {
        messageVM.loadMessageData {
            
        }
        
    }
}

