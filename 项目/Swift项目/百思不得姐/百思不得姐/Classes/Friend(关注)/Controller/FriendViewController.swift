//
//  FriendViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/10.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏标题
        navigationItem.title = "我的关注"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "friendsRecommentIcon", highImage: "friendsRecommentIcon-click", targat: self, action: #selector(tagClick))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tagClick() {
        
        let vc = UIStoryboard(name: "FriendStoryboard", bundle: nil).instantiateViewController(withIdentifier: "RecommendVC")
        navigationController?.pushViewController(vc, animated: true)
        
        
    }

}
