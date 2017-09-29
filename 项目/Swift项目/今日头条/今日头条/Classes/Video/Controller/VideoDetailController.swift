//
//  VideoDetailController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit
import BMPlayer
import NVActivityIndicatorView
import SVProgressHUD

class VideoDetailController: UIViewController {
    
    /// 播放器
    fileprivate lazy var player = BMPlayer()
    var changeButton = UIButton()
    var playTimeDidChange:((TimeInterval, TimeInterval) -> Void)?
    
    var videoTopic: WeiTouTiao? {
        didSet {
            NetworkTool.loadNewsDetailRelateNews(fromCategory: "", weitoutiao: videoTopic!) { (relateNews, labels, userLike, appInfo, filter_wrods) in
                self.relateNews = relateNews
            }
        }
    }
    
    var offset: Int = 0
    var realVideo: RealVideo?
    
    var relateNews = [WeiTouTiao]()
    var comments = [NewsDetailImageComment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: NSNotification.Name.UIApplicationWillEnterForeground,  object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension VideoDetailController {
    
    @objc func applicationWillEnterForeground() {
        
    }
    
    @objc func applicationDidEnterBackground() {
        player.pause(allowAutoPlay: false)
    }
    
    /// 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.orange
    }
}
