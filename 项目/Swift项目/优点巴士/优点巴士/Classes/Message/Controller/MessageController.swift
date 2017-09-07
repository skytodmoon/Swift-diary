//
//  MessageController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let messageCellID = "messageCellID"

class MessageController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var messageVM : MessageViewModel = MessageViewModel()
    fileprivate lazy var tableView : UITableView = {[unowned self] in

        let tableView = UITableView(frame: self.view.bounds)
        tableView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: messageCellID)
        return tableView
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpMainView()
        
        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

// MARK:- 设置UI界面
extension MessageController {
     func setUpMainView() {
        self.title = "消息"
        view.addSubview(tableView)
        
    }
}

// MARK:- 请求数据
extension MessageController {
    func loadData() {
        messageVM.loadMessageData {
            
            self.tableView.reloadData()
        }
        
    }
}

// MARK:- 遵守UITableView的数据源&代理
extension MessageController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageVM.message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellID, for: indexPath) as! MessageTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.messagemodel = messageVM.message[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webviewVC = WebViewController()
        
        navigationController?.pushViewController(webviewVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

