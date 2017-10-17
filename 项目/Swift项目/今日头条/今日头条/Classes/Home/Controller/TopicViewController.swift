//
//  TopicViewController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import BMPlayer
import SnapKit
import MJRefresh
import SVProgressHUD

class TopicViewController: UIViewController {
    
    var lastSelectedIndex = 0
    /// 播放器
    fileprivate lazy var player = BMPlayer()
    
    // 记录点击的顶部标题
    var topicTitle: TopicTitle?
    
    // 存放新闻主题的数组
    fileprivate var newsTopics = [WeiTouTiao]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
