//
//  LiveViewController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kTitlesViewH : CGFloat = 44

class LiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpMainView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - 懒加载


}

//MARK: - 设置UI
extension LiveViewController {
    fileprivate func setUpMainView() {
        setUpNavgationBar()
    }
    fileprivate func setUpNavgationBar(){
        navigationItem.title = ""
    }
}
