//
//  VideoTopicController.swift
//  微博
//
//  Created by 金亮齐 on 2017/9/6.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import BMPlayer
import MJRefresh
import SVProgressHUD
import NVActivityIndicatorView

class VideoTopicController: UIViewController {
    
    /// 播放器
    fileprivate lazy var player = BMPlayer()
    
    fileprivate let disposeBag = DisposeBag()
    /// 上一次点击的 cell
    var lastCell = VideoTopicCell()
    
    // 记录点击的顶部标题
    var videoTitle: TopicTitle?
    // 存放新闻主题的数组
    fileprivate var newsTopics = [TouTiao]()


    override func viewDidLoad() {
        super.viewDidLoad()

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
