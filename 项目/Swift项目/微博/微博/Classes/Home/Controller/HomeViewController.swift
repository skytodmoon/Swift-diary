//
//  HomeViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {
    
    
    var statuses: [Status]?
    {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !userIsLogin
        {
            visitorView.setupVisitorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "我是醉看红尘这场梦,这是我仿写的新浪微博客户端")
            return;
        }
        
        setupNav()
        
        tableView.register(StatusNormalTableViewCell.self, forCellReuseIdentifier: StatusTableViewCellIdentifier.NormalCell.rawValue)
        tableView.register(StatusForwardTableViewCell.self, forCellReuseIdentifier: StatusTableViewCellIdentifier.ForwardCell.rawValue)
        tableView.separatorStyle = .none
        
//        refreshControl = HomeRefreshControl()
//        refreshControl?.addTarget(self, action: #selector(HomeViewController.loadData), for: UIControlEvents.valueChanged)
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
   
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNav(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(HomeViewController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(HomeViewController.rightItemClick))
        
        let titleBtn = TitleButton()
        titleBtn.setTitle("醉看红尘这场梦", for: .normal)
        titleBtn.addTarget(self, action: #selector(HomeViewController.titltBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    lazy var pullupRefreshFlag:Bool = false
    
    func loadData(){
        var since_id = statuses?.first?.id ?? 0
        
        var max_id = 0
        if pullupRefreshFlag
        {
            since_id = 0
            max_id = statuses?.last?.id ?? 0
        }
        
        Status.loadStatuses(since_id: since_id,max_id: max_id) { (models, error) -> () in
            
            self.refreshControl?.endRefreshing()
            
            if error != nil
            {
                return
            }
            if since_id > 0
            {
                self.statuses = models! + self.statuses!
            }else if max_id > 0{
                self.statuses = self.statuses! + models!
            }else{
                self.statuses = models
            }
        }
    }

    func change(){
        let titleBtn = navigationItem.titleView as! TitleButton
        titleBtn.isSelected = !titleBtn.isSelected
    }
    
    func titltBtnClick(){
        print(#function)
    }
    

    
    var rowCache: [Int: CGFloat] = [Int: CGFloat]()
    
    override func didReceiveMemoryWarning() {
        rowCache.removeAll()
    }

    func leftItemClick(){
        print(#function)
    }
    
    func rightItemClick(){
        print(#function)
        print(UserAccount.loadAccount() ?? "nil")
    }
}

extension HomeViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let status = statuses![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: StatusTableViewCellIdentifier.cellID(status: status), for: indexPath) as! StatusTableViewCell
        cell.status = status
        
        let count = statuses?.count ?? 0
        if indexPath.row == (count - 5)
        {
            // 滚动即将触底时,加载更多数据
            pullupRefreshFlag = true
            loadData()
        }
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let status = statuses![indexPath.row]
        
        if let height = rowCache[status.id]
        {
            return height
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: StatusTableViewCellIdentifier.cellID(status: status)) as! StatusTableViewCell
        // 4.拿到对应行的行高
        let rowHeight = cell.rowHeight(status: status)
        rowCache[status.id] = rowHeight
        return rowHeight
    }

}
