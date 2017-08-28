//
//  RoomViewController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

private let kMoreInfoViewH : CGFloat = 90
private let kSocialShareViewH : CGFloat = 250
private let kChatToolsViewHeight : CGFloat = 44
private let kChatComtetViewHeight : CGFloat = 150
private let kgiftViewHeight : CGFloat = kScreenH * 0.5

class RoomViewController: UIViewController,Emitterable {
    
    // MARK: 对外提供控件属性
    var anchor : LiveAnchorModel?
    
    
    // MARK: 控件属性
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var roomNumLabel: UILabel!
    @IBOutlet weak var onlineLabel: UILabel!
    
    // MARK: 懒加载聊天视图
    fileprivate lazy var chatToolsView : ChatToolsView = ChatToolsView.loadFromNib()
    // 懒加载礼物视图
    fileprivate lazy var giftView : GiftListView = GiftListView.loadFromNib()
    // 懒加载更多信息视图
    fileprivate lazy var moreinfoView: MoreInfoView = MoreInfoView.loadFromNib()
    // 懒加载分享视图
    fileprivate lazy var shareView: ShareView = ShareView.loadFromNib()
    // 懒加载 ChatContentView 视图
    fileprivate lazy var chatContentView: ChatContentView = ChatContentView.loadFromNib()
    fileprivate lazy var giftContainerView : GiftContainerView = GiftContainerView(frame: CGRect(x: 0, y: 100, width: 250, height: 100))
    
    // 懒加载即时通讯
    fileprivate lazy var socket : Socket = Socket(addr: "0.0.0.0", port: 7878)
    
    // 定义定时器属性
    fileprivate var heartBeatTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 1.设置 UI 界面
        setupUI()
        
        // 2监听键盘的弹出
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        // 3.连接聊天服务器
        if socket.connectServer() {
            print("连接成功")
            // 3.1 开始读取信息
            socket.startReadMsg()
            // 3.2 添加心跳包
            addHeartBeatTimer()
            // 3.3 发送加入房间消息
            socket.sendJoinRoom()
            // 3.4 设置 socket 的代理
            socket.delegate = self
        }
        
        // 4.请求主播的信息
        loadAnchorLiveAddress()

        // Do any additional setup after loading the view.
    }

}
// MARK:- 设置UI界面内容
extension RoomViewController {
    fileprivate func setupUI() {
        
    }
}

// MARK: 监听键盘的弹出
extension RoomViewController {
    @objc fileprivate func keyboardWillChangeFrame(_ note: Notification) {
        print("监听键盘弹出")
    }
}

extension RoomViewController {
    
    fileprivate func loadAnchorLiveAddress() {
        
    }
}
