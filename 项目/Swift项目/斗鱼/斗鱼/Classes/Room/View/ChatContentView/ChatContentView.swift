//
//  ChatContentView.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kChatContentViewID = "kChatContentViewID"

class ChatContentView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    // 定义一个数组,用来保存所有的 message 消息
    fileprivate lazy var messages: [NSAttributedString] = [NSAttributedString]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 注册 cell
        
        tableView.register(UINib(nibName: "XJChatContentViewCell", bundle: nil), forCellReuseIdentifier: kChatContentViewID)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    // MARK: 给外界暴露一个函数,将外界传入的数据保存到数组当中
    func insertMessage(_ message : NSAttributedString) {
        messages.append(message)
        tableView.reloadData()
        // 将数据滚动到最底部
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
}

extension ChatContentView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kChatContentViewID, for: indexPath) as! ChatContentViewCell
        cell.contentLabel.attributedText = messages[indexPath.row]
        
        
        return cell
    }
}
