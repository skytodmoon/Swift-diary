//
//  FollowDetailViewController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import IBAnimatable

class FollowDetailViewController: AnimatableModalViewController {
    
    var followDetail: FollowDetail?
    
    var userid = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension FollowDetailViewController {
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.white
    }
}
